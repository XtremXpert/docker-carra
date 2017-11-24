/**
 * @class ProtoUL.ux.ProtoZoom
 * @extends Ext.form.field.Text Field with search fk model
 * @author Dario Gomez
 */

/*
 * Para cargar la info en los campos relacionados en la grilla disparar un evento desde aqui, al
 * momento de aceptar Cambiar el text del campo,
 * 
 * 
 * En la definicion del editor con el protozoom definir una coleccion de id's a los objetos zoom, y
 * seguir los eventos
 * 
 * De esta forma en la grilla puedo saber el registro q se esta editando antes del commit y
 * modificar los cmpos necesarios directamente en el store ( record ) de la grilla
 * 
 * 
 * Otra posible soluicion es guardar el Id y asociar la descripcion para luego renderizarla
 * 
 * Verificar si dinamicamente puedo pegar el registro del zoom en el campo para q pueda ser
 * recuperado por el evento beforecommit
 * 
 */

/* jslint nomen: true, sloppy : true, white : true, sub : true */
/* global Ext */
/* global _SM */

Ext.define('Softmachine.view.smform.ProtoZoom', {
    extend : 'Ext.form.field.Text',
    alias : 'widget.protoZoom',
    xtype : 'protoZoom',

    requires : [
        'Softmachine.view.toolbar.SearchToolBar',
    // 'Softmachine.view.smform.ProtoZoomController'
    ],

    // controller: 'protoZoomController',

    // * Zoom initialization
    zoomModel : null,
    zoomGrid : null,
    zoomRecord : null,

    zoomRecords : null,
    zoomMultiple : false,

    // trigger button cls

    triggers : {
        clear : {
            cls : 'x-form-clear-trigger',
            handler : function(){
                this.onZoomClearTriggerClick()
            },

        // hidden: true,
        // scope : this
        },
        search : {
            cls : 'x-form-search-trigger',
            handler : function(){
                this.onZoomTriggerClick()
            },
            weight : 1,
        // scope : this
        }
    },

    // readOnlyCls : 'protoLink',

    /**
     * @private Indica si todos los atributos de configuracion fueron cargados, permitiria
     *          reutilizar la forma solo cambiando el filtro
     */
    isLoaded : false,
    handleMouseEvents : true,

    /*
     * Formato de Link fieldStyle: 'color: -webkit-link !important;text-decoration: underline
     * !important;cursor: auto !important;', fieldCls: 'protoLink',
     */

    initComponent : function(){
        var me = this;
        this.callParent(arguments);

        // Para activar el evento con ENTER
        this.on('specialkey', function(f, e){
            if (e.getKey() == e.ENTER) {
                this.onZoomTriggerClick();
            }
        }, this);
    },

    initZoom : function( zoomModel, callBackContext, callBackfunction  ){
        // Only need in external fire 

        Ext.apply ( this, { 
            zoomModel : zoomModel,
            isLoaded : false, 
            zoomGrid : null,
            zoomRecord : null,

            zoomRecords : null,

            zoomFilter : null,
            zoomMultiple : false,
            callBackfunction : callBackfunction, 
            callBackContext : callBackContext, 
        }) 

    },

    listeners : {
        'render' : function(cmp1){
            cmp1.getEl().on('click', this.onClickLink, this);
        },
        'onZoomFilterFieldChange' : function(cmp1){
            // cmp1.getEl().on('click', this.onClickLink, this);
        }

    },

    onClickLink : function(ev, nd){
        // La funcion Link solo se activa si es readOly
        if (!this.readOnly) {
            return;
        }
        if (nd.nodeName == "LABEL") {
            return;
        }

        this._loadZoom(this.doClickLink);
    },

    _loadZoom : function(fnBase, opts){
        var me = this, options = {
            scope : me,
            success : function(obj, result, request){
                me.createZoomWindow(me);
                fnBase.call(me, me, opts);
            },
            failure : function(obj, result, request){
                return;
            }
        };

        if (_SM.loadPci(me.zoomModel, true, options)) {
            me.createZoomWindow(me);
            fnBase.call(me, me, opts);
        }

    },

    doClickLink : function(me){

        var formController = Ext.create('Softmachine.view.smform.FormController', {});
        formController.openProtoForm.call(formController, me.zoomModel, me.fkIdValue, false);

    },

    createZoomWindow : function(me){
        // @ZoomRaise

        function doCancel(){
            me.resetZoom();
            me.win.hide();
        }

        if (me.isLoaded) {
            return;
        }

        me.myMeta = _SM._cllPCI[me.zoomModel];

        var selMode = 'single';
        if (me.zoomMultiple && me.newForm) {
            selMode = 'multi';
        }

        // Crea la grilla
        this.zoomGrid = Ext.create('Softmachine.view.smgrid.SMGrid', {
            gridSelectionMode : selMode,
            viewCode : me.zoomModel,
            // initialFilter : [{ 'property' : 'pk', 'filterStmt' : -1 }],
            initialFilter : [],

            hideSheet : true,
            listDisplay : '__str__'
        });

        var searchBG = Ext.create('Softmachine.view.toolbar.SearchToolBar', {
            myMeta : me.myMeta
        });

        this.zoomGrid.on({
            selectionChange : {
                fn : function(selModel, record, rowIndex, eOpts){
                    me.setSelected(rowIndex, record, selModel);
                },
                scope : this
            }
        });

        this.zoomGrid.on({
            rowDblClick : {
                fn : function(record, rowIndex){
                    me.setSelected(rowIndex, record);
                    me.doReturn();
                },
                scope : me
            }
        });

        searchBG.on({
            qbeLoadData : {
                fn : function(searchBG, sFilter, sTitle, sorter){
                    me.resetZoom();
                    this.zoomGrid.gridLoadData(this.zoomGrid, sFilter, sorter);
                },
                scope : this
            }
        });

        // Para identificar el StatusBar
        me.idStBar = Ext.id();

        // @@ Verificar los permisos de usuario
        var perms = _SM._UserInfo.perms[me.myMeta.viewCode], 
            zoomBtns = [
            {
                xtype : 'tbtext',
                text : '',
                id : me.idStBar,
                flex : 1,
                readOnly : true
            },
            {
                xtype : 'button',
                text : _SM.__language.Text_Cancel_Button,
                scope : me,
                handler : doCancel
            },
            {
                xtype : 'button',
                text : 'Ok',
                scope : me,
                handler : me.doReturn
            }
        ];

        // if ( perms['change'] ) {
        // zoomBtns.push( { xtype: 'button', text: 'Edit', scope: me, handler: doEdit } )
        // }
        // if ( perms['add'] ) {
        // zoomBtns.push( { xtype: 'button', text: 'New', scope: me, handler: doNew } )
        // }

        // referencia a la ventana modal
        me.win = Ext.widget('window', {
            title : 'Zoom : ' + me.myMeta.shortTitle,
            constrainHeader : true,
            iconCls : me.myMeta.viewIcon,
            closeAction : 'hide',
            layout : 'fit',
            modal : true,
            width : 800,
            minWidth : 400,
            height : 600,
            minHeight : 400,
            resizable : true,
            tbar : searchBG,
            items : this.zoomGrid,

            dockedItems : [
                {
                    xtype : 'toolbar',
                    dock : 'bottom',
                    ui : 'footer',
                    defaults : {
                        minWidth : 75
                    },
                    items : zoomBtns
                }
            ]

        });

        me.isLoaded = true;
        this.zoomGrid.setEditMode(true);

    },

    onZoomTriggerClick : function(){
        // this.onZoomFilterFieldChange(field, field.getValue());
        this._loadZoom(this.doTriggerClick);
    },

    doTriggerClick : function(me){

        me.showZoomForm(me);
    },

    showZoomForm : function(me){
        if (!me.isLoaded) {
            return;
        }

        // verifica el zoomFilter
        var myZoomFilter = getFilter();
        if (myZoomFilter) {
            this.zoomGrid.store.zoomFilterParams(myZoomFilter);
        }

        me.win.show();

        function getFilter(){

            /*
             * La cadena de zoom filter se envia junto con la fila actual de la grilla para que sea
             * resuelta por el backend; Las reglas de definicion se manejaran en el backend
             */

            if (!me.zoomFilter) {
                return {};
            }

            // if (!me.idSMGrid) {return {}; }
            // Esto trae la grilla activa, es correcto en la edicion, pero no en la creacion, debe existir un nuevo registro
            // var myGridBase = Ext.getCmp( me.idSMGrid );
            var rowData = me.up('form').tmpRegister
            var myFilter = {
                'zoomFilter' : me.zoomFilter,
                'baseRow' : rowData
            };

            return myFilter;
        }
    },

    setSelected : function(rowIndex, record, selModel){
        // @ZoomSelection

        var stBar = Ext.getCmp(this.idStBar), me = this, ix;
        if ( ! me.isLoaded ) { return }

        function getZoomReturn(record){
            var recStr;
            if (!record)
                return;
            if (me.myMeta.returnField) {
                recStr = record.get(me.myMeta.returnField);
            } else {
                recStr = record.get('__str__') || me.myMeta.viewCode + '.str?';
            }
            return {
                'name' : me.name,
                'fkId' : me.fkId,
                'recId' : record.get('id'),
                'recStr' : recStr
            };
        };

        if (me.zoomMultiple && me.newForm && selModel) {
            me.zoomRecords = [];
            var cllSelection = selModel.getSelection();
            for (ix in cllSelection) {
                me.zoomRecords.push(getZoomReturn(cllSelection[ix]));
            }

            var strAux = '';
            for (ix in me.zoomRecords) {
                strAux += me.zoomRecords[ix].recStr + ';';
            }
            stBar.setText(strAux);
            me.retField = strAux;

        } else if (record) {
            var zoomRet = getZoomReturn(record);

            me.zoomRecord = record;
            me.retField = zoomRet.recStr;

            stBar.setText('[' + zoomRet.recId.toString() + ']  ' + zoomRet.recStr);

        } else {
            me.zoomRecord = null;
            me.zoomRecords = null;
            stBar.setText('');
        }

    },

    doReturn : function(){
        // @ZoomReturn
        // Asigna el returnField al text de base
        this.setValue(this.retField);
        this.win.hide();

        if ( this.callBackfunction  ) { 
            this.callBackfunction.call( this.callBackContext, this  ); 
        }
    },

    resetZoom : function(){
        // Empty selection no row data 
        this.setSelected();
    },

    onZoomFilterFieldChange : function(field, value){
        var me = this, tree = me.getReferences().tree;

        if (value) {
            me.preFilterSelection = me.getViewModel().get('selectedView');
            me.rendererRegExp = new RegExp('(' + value + ')', "gi");
            field.getTrigger('clear').show();
            me.filterStore(value);
        } else {
            me.rendererRegExp = null;
            tree.store.clearFilter();
            field.getTrigger('clear').hide();

            // Ensure selection is still selected.
            // It may have been evicted by the filter
            if (me.preFilterSelection) {
                tree.ensureVisible(me.preFilterSelection, {
                    select : true
                });
            }
        }
    },

    onZoomClearTriggerClick : function(){
        this.setValue();
        this.resetZoom();
    },

});
