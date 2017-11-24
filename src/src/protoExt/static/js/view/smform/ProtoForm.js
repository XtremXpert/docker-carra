/*  ---  ProtoForm

 Se llama genericamente forma, y corresponde a un panel que puede ser adosado a una ventana
 o a un contenedor cualquiera,

 La forma se divide en secciones,  las secciones son de un tipo particular correspondiente
 a los diferentes contenedores,  las secciones por defecto son simplemente fieldset

 El el arbol solo se encontraran

 Secciones  ...
 ....
 fieldset
 Campos

 no deberia mezclarse en el diseno campos y secciones dentro del mismo contenedor
 los field set son los contenedores de campos, los demas solo pueden contener otros contenedores

 renderer: this.formatDate,
 */

/*jslint nomen: true, sloppy : true, white : true, sub : true */
/*global Ext */
/*global _SM */

Ext.define('Softmachine.view.smform.ProtoForm', {
    extend : 'Ext.form.Panel',
    alias : 'widget.protoform',

    requires : [
        'Softmachine.view.smmasterdetail.MDLinkController', 
        'Softmachine.view.smform.ProtoZoom'
    ],

    // @myMeta Base Definition
    myMeta : null,
    newForm : false,

    // @formConfig Objeto correspondiente a la forma en la meta ( forma parte de la meta )
    formConfig : null,

    // @prFormLayout : Componentes de la forma ( Itmems del arbol )
    prFormLayout : [],

    // Mantiene el IdMaster para las operaciones maestro detalle
    idMaster : -1,
    masterRecord : null,

    linkDetails : false,
    isReadOnly : false,

    // @ Store asociado al registro de entrada linked o independiente
    store : null,

    // Coleccion de campos html definidos en htmlSet
    cllDetGrids : [],
    htmlPanels : {},

    // Defne como manejar maneja los campos heredados de los zoom
    zoomReturnDef : null,

    // Registro temporal para enviar como parametro de los zooms
    tmpRegister : {},

    // Coleccion con los retornos
    zoomMultiReturn : [],

    initComponent : function(){
        // this.addEvents('create', 'close', 'hide');

        var me = this, myMeta = this.myMeta, _pForm = this;

        this.btSave = Ext.create('Ext.Button', {
            // id : this.idSaveBt,
            iconCls : 'icon-saveMs',
            text : _SM.__language.Text_SaveMs_Button,
            scope : this,
            handler : this.onSave
        });

        this.btSaveDet = Ext.create('Ext.Button', {
            // id : this.idSaveBtDt,
            iconCls : 'icon-saveDt',
            text : _SM.__language.Text_SaveDt_Button,
            hidden : true,
            disabled : true,
            scope : this,
            handler : this.onSaveDet
        });

        this.btCancelFormEdt = Ext.create('Ext.Button', {
            // id : this.idSCancel,
            iconCls : 'icon-close',
            text : _SM.__language.Text_Close_Button,
            scope : this,
            handler : this.onReset
        });

        this.stMsg = Ext.create('Ext.toolbar.TextItem');

        Ext.apply(this, {
            frame : true,
            autoScroll : true,
            // scrollable : true,

            bodyStyle : 'padding:5px 5px',
            bodyPadding : 10,
            masterRecord : null,
            items : this.prFormLayout,

            dockedItems : [
                {
                    xtype : 'toolbar',
                    dock : 'bottom',
                    ui : 'footer',
                    items : [
                        this.stMsg,
                        '->',
                        this.btSave,
                        this.btSaveDet,
                        this.btCancelFormEdt
                    ]
                }
            ]

        });

        this.callParent();

        this.linkController = Ext.create('Softmachine.view.smmasterdetail.MDLinkController', {});
        this.getHtmlPanels();

        // Asigna los campos heredados
        defineCpFromReturn(me);

        // Obtiene los botones de detalle
        this.cllBtDetails = getBtDetails(me.items.items, me);
        if (this.cllBtDetails.length > 0) {
            this.linkDetails = true;
            asignaDetailDefinition(me, me.cllBtDetails);
        }

        // Obtiene los store de las grillas dependientes y asigna el listener startEdition
        this.cllDetGrids = getDetails(me.items.items, me);
        if (this.cllDetGrids.length > 0) {
            this.linkDetails = true;
            this.btSaveDet.show();
            asignaDetailDefinition(me, me.cllDetGrids);
        }

        // Lo genera de nuevo, quedaban componentes mal ubicados
        // this.doLayout();

        function getDetails(prItems, me){
            // Obtiene los store de las grillas recursivamente
            var cllDetGrids = [], lGrid, ixV;
            for (ixV in prItems) {
                lGrid = prItems[ixV];
                if (lGrid.__ptType == "smGrid") {
                    if (lGrid.myMeta) {
                        cllDetGrids.push(lGrid);
                    }
                    ;
                } else if (lGrid.items && lGrid.items.items) {
                    cllDetGrids = cllDetGrids.concat(getDetails(lGrid.items.items, me));
                }
            }
            return cllDetGrids;
        }

        function getBtDetails(prItems, me){
            // Obtiene los botones de detalle recursivamente
            var cllBtDetails = [], ixV, lObj;
            for (ixV in prItems) {
                lObj = prItems[ixV];
                if (lObj.__ptType === "detailButton") {
                    cllBtDetails.push(lObj);
                } else if (lObj.items && lObj.items.items) {
                    cllBtDetails = cllBtDetails.concat(getBtDetails(lObj.items.items, me));
                }
            }
            return cllBtDetails;
        }

        function asignaDetailDefinition(me, cllDets){
            // Indexa los stores y/o loas botones con la info de los detalles copiando la info del
            // detalle
            var lObj, lDet, ix, ixD;
            for (ix in cllDets) {
                lObj = cllDets[ix];

                lObj.linkController = me.linkController;
                lObj.detailDefinition = _SM.getDetailDefinition(me.myMeta, lObj.viewCode);
            }
        }

        function defineCpFromReturn(me){
            // Define la coleccion de campos heredados a partir del zoom
            // mantiene una lista con la definicion de los cpFromField
            var ix, cpFrom, vFld;

            this.zoomReturnDef = [];

            // Crea la coleccion de campos q deben heredarse
            for (ix in me.myMeta.fields) {
                vFld = me.myMeta.fields[ix];
                if (!vFld.cpFromZoom) {
                    continue;
                }
                cpFrom = {
                    "name" : vFld.fName,
                    "cpFromZoom" : vFld.cpFromZoom,
                    "cpFromField" : vFld.cpFromField
                };
                this.zoomReturnDef.push(cpFrom);
            }
        }
    },

    setDetailsTilte : function(){
        var ix, lGrid;
        for (ix in this.cllDetGrids) {
            lGrid = this.cllDetGrids[ix];
            lGrid.embededGrid = true;
            lGrid.setGridTitle(lGrid);
        }
    },

    showProtoForm : function(){
        _SM.showConfig('Form Config', this.myMeta.formConfig);
    },

    showLayoutConfig : function(){
        _SM.showConfig('LayoutConfig', this.prFormLayout);
    },

    updateHtmlPanels : function(record){
        var sHtml, ix, obj;
        for (ix in this.htmlPanels) {
            obj = this.htmlPanels[ix];
            if (record) {
                sHtml = record.get(ix);
            } else {
                sHtml = '';
            }
            obj.update(sHtml);
            obj.rawHtml = sHtml;
        }
    },

    readHtmlPanels : function(record){
        var ix, obj;
        for (ix in this.htmlPanels) {
            obj = this.htmlPanels[ix];
            record.set(ix, obj.rawHtml);
        }
    },

    setText : function(sText){
        this.stMsg.setText(sText);
    },

    onReset : function(){
        // this.setActiveRecord(null);
        // this.getForm().reset();
        this.idMaster = null;
        this.fireEvent('close', this);
    },

    updateZoomIds : function(){

        // La info del zoom permanece en el campo fk, es necesario actualizar el registro
        // antes de guardarlo, TODO: esto se podria hacer en el zoomReturn ( cpFromField ) para
        // actualzar
        // otros campos derivados del zoom.

        var me = this, lFields = me.getForm().getFields().items, ix, zoomField;

        // inicializa me.zoomMultiReturn
        me.zoomMultiReturn = null;

        // Manejo del retorno del zoom
        for (ix in lFields) {
            zoomField = lFields[ix];
            if (!zoomField.zoomModel) {
                continue;
            }

            // Verifica los campos multizoom
            if (zoomField.zoomMultiple && me.newForm) {

                if (!me.zoomMultiReturn) {
                    me.zoomMultiReturn = [];
                }
                me.zoomMultiReturn.push(zoomField.zoomRecords);

            } else if (zoomField.zoomRecord) {
                // Actualiza el IdValue en el zoom para hacer los vinculos
                zoomField.fkIdValue = this.masterRecord.get(zoomField.fkId);

                // Actualiza el Id con el dato proveniente del zoom
                me.updateFormField(zoomField.fkId, zoomField.zoomRecord.data.id);
            }
            // Actualiza los valores de retorno
            // this.updateZoomReturn( zoomField )
        }

    },

    updateFormField : function(fldName, fldValue){
        var lRec = {};
        lRec[fldName] = fldValue;
        this.getForm().setValues(lRec);

        // TODO : verifier modified ??? in extjs 6 
        lRec = this.masterRecord;
        lRec.data[fldName] = fldValue;
        if ( lRec.modified && (!lRec.modified[fldName])) {
            lRec.modified[fldName] = lRec.data[fldName];
        }
    },

    onCreate : function(){
        var form = this.getForm();

        if (form.isValid()) {
            this.fireEvent('create', this, form.getValues());
            form.reset();
        }

    },

    setFormReadOnly : function(bReadOnly){

        // por defecto viene editable
        this.isReadOnly = bReadOnly;

        // desactiva el boton save
        this.btSave.setDisabled(bReadOnly);
        this.btSaveDet.setDisabled(bReadOnly);
        this.btCancelFormEdt.setDisabled(bReadOnly);

        this.setReadOnlyFields(bReadOnly);
        this.setDetailsReadOnly(bReadOnly);

        if (this.linkController) {
            this.linkController.isReadOnly = this.isReadOnly;
        }

    },

    setDetailsReadOnly : function(bReadOnly){
        var lObj, ix;
        for (ix in this.cllDetGrids) {
            lObj = this.cllDetGrids[ix];
            lObj.setEditMode(!bReadOnly);
        }
    },

    setReadOnlyFields : function(bReadOnly, readOnlyFields){
        /*
         * @bReadOnly Toogle T/F 
         * readOnly FIX: mask ? 
         */

        // var readOnlyCls = 'protofield-readonly'
        var myFields = this.getForm().getFields(), obj, ix, fDef;
        for (ix in myFields.items) {
            obj = myFields.items[ix];
            if (obj.readOnly) {
                obj.setReadOnly(true);
            } else if (!readOnlyFields || (obj.name in _SM.objConv(readOnlyFields))) {
                // El obj no es readOnly pero la forma si, se podria poner una mascara, pero q pasa
                // con el zoom
                obj.setReadOnly(bReadOnly);
            }
        }

        // Recorre los htmlPanels
        for (ix in this.htmlPanels) {
            obj = this.htmlPanels[ix];
            fDef = obj.__ptConfig;

            if (fDef.readOnly) {
                obj.setReadOnly(true);
            } else if (!readOnlyFields || (fDef.name in _SM.objConv(readOnlyFields))) {
                obj.setReadOnly(bReadOnly);
            }
        }
    },

    getHtmlPanels : function(){
        // Busca si tiene htmlSets podria agregarse los paneles como campos,
        // los paneles al interior deberian heredar de 'Ext.form.field.Base' y mezclar
        // Ext.form.Basic
        // setear propiedad isFormField : true
        // implementar por lo menos los metodos : valueToRaw, setRawValue

        getHtmlPanelDefinition(this.items.items, this);

        function getHtmlPanelDefinition(formItems, me){
            var vFld, ix;
            for (ix in formItems) {
                vFld = formItems[ix];

                if (vFld.xtype === "htmlset") {
                    Ext.apply(me.htmlPanels, vFld.htmlPanels);
                } else if (vFld.xtype === "fieldset") {
                    getHtmlPanelDefinition(vFld.items.items, me);
                }
            }
        }

    },

    setActiveRecord : function(record){
        var me = this;
        this.masterRecord = record;
        this.store = record.store;


        if (record ) {

            if ( record.phantom ) {
                this.idMaster = -1;
                record.set('id', -1);
            } else {
                this.idMaster = record.get('id');    
            }
            
            this.getForm().loadRecord(record);
            // 1312: No hay necesidad de actulizar los zoomsId pues vienen del registro
            // this.loadN2N( record );
            // this.updateZoomIds();
        } else {
            this.getForm().reset();
        }


        this.linkDetail(record);
        this.updateHtmlPanels(record);

        // -------------------------------------------------- -------- evento del store
        this.store.on({
            update : function(store, record, operation, eOpts){
                if (record && this.linkDetails) {
                    this.idMaster = record.get('id');
                    this.myFormController.newForm = false;
                    this.linkDetail(record);
                    this.setDetailsReadOnly(false);
                }
            },
            scope : me
        });
    },

    linkDetail : function(record){
        if (!this.linkDetails) {
            return;
        }

        var me = this, lGrid, lObj, detailLink, ixDet;
        me.linkController.setMasterData(record.data);

        for (ixDet in me.cllDetGrids) {

            me.linkController.isReadOnly = me.isReadOnly;
            lGrid = me.cllDetGrids[ixDet];
            detailLink = me.linkController.getDetailLink(lGrid.detailDefinition);
            lGrid.store.myLoadData(detailLink.detFilter, null, me.idMaster);

            if (me.idMaster >= 0 && (!me.isReadOnly)) {
                lGrid.setEditMode(!me.isReadOnly);
                me.linkController.setDetailDefaults(lGrid.detailDefinition, lGrid.myFieldDict);
            }
        }

        // active buttons 
        if (me.idMaster >= 0 && (!me.isReadOnly)) {
            for (ixDet in me.cllBtDetails) {
                lObj = me.cllBtDetails[ixDet];
                lObj.setButtonsReadOnly(false);
            }
        }
    },


    onSaveDet : function(){
        /*
         * El guardado se hace en varios ciclos. - Se requiere tener un maestro, si es upd, el
         * maestro ya existe los defectos se sinclronizan si es nuevo, se deshabilita el boton de
         * guardar detalles hasta q exista un idMaster y un activeRecord - en upd se guarda el
         * maestro y se actualiza el idMaster, y masterRecord se habilita la edicion de las grillas
         * se puede esperar un evento "editComplete" para esto generado por el store; antes de
         * iniciar la edicion la grilla lanza un before edit q puede ser cancelado si no hay
         * idMaster
         */

        this.onSave();
        this.fireEvent('close', this);

    },

    onSave : function(){

// DGT 1604
        var me = this, tmpAutoSync, form, lProduct, lBase, lRec, lZRet, ix, iz, ib;
        var modelName = _SM.getModelName(me.myMeta.viewCode)

        tmpAutoSync = me.store.autoSync;
        form = me.getForm();
        me.updateZoomIds();

        if (!form.isValid()) {
            me.setText(_SM.__language.Msg_Invalid_Form);
            return;
        }
        if (!me.masterRecord) {
            return;
        }

        form.updateRecord(me.masterRecord);
        me.readHtmlPanels(me.masterRecord);

        // Try to improve performance...
        // me.store.suspendEvents();

        // Si es nuevo
        if (me.myFormController.newForm) {


            // DGT  TreeRecord 
            // var rootNode = monPretree.getRootNode();
            // rootNode.insertChild(4,task); 


            if ( me.store.treeRef ) {

                // TreeGrid 
                var pNode = me.store.treeRef.parentNode;  
                pNode.appendChild( me.masterRecord )


            } else if (!me.zoomMultiReturn) {
                me.store.add(me.masterRecord);

            } else {

                // La carga de multiples zooms siempre se debe hacer en una unica llamada.
                me.store.autoSync = false;

                // Variable para alojar los retornos multiples
                lProduct = _SM.Product(me.zoomMultiReturn);
                for (ix in lProduct) {

                    // Producto Cartersiano de multiReturn
                    lBase = lProduct[ix];

                    // lRec = me.masterRecord.copy();
                    lRec = Ext.create(modelName, {});

                    // Obtiene los datos del masterRecord 
                    for (ib in me.masterRecord.data ) {
                        if ( ib == 'id' ) {continue; }
                        lRec.data[ ib ] = me.masterRecord.data[ ib ]
                    }

                    // Copia los datos de los zoom multiples 
                    for (iz in lBase) {
                        lZRet = lBase[iz];
                        lRec.data[lZRet.name] = lZRet.recStr;
                        lRec.data[lZRet.fkId] = lZRet.recId;
                    }
                    // lRec.phantom = true;
                    // lRec.dirty = true;
                    me.store.add(lRec);

                }

            }
        }

        // DGT: Esto deberia ser parametrizado; la version actual maneja autosync = true
        if (me.store.autoSync !== true) {
            _SM._doSyncMasterStore( me.store );
        }

        // me.store.resumeEvents();
        // Restaura el autosync
        me.store.autoSync = tmpAutoSync;

        if (me.cllDetGrids.length > 0) {
            me.btSave.setDisabled(true);
            me.btSaveDet.setDisabled(false);
        } else {
            me.fireEvent('close', me);
        }

    },

    setZoomEditMode : function(me){
        // Para determinar el comportamiento del zoom de seleccion multiple

        var lFields = me.getForm().getFields().items, ix;

        // Manejo del retorno del zoom
        for (ix in lFields) {
            if (lFields[ix].xtype === 'protoZoom') {
                lFields[ix].newForm = me.newForm;
            }
        }
    },

    updateZoomReturn : function(zoomFld){
        // El problema es en q momento se dispara,
        // hay q capturar un evento para cerrar la ventana de zoom
        // verifica si esta definido y lo define a necesidad

        var ix, cpFrom;

        // Verifica si hay elementos a heredar
        if (this.zoomReturnDef.length == 0) {
            return;
        }
        ;

        // Recorre las propiedades a heredar
        for (ix in this.zoomReturnDef) {
            cpFrom = this.zoomReturnDef[ix]
            if (cpForm.cpFromZoom == zoomFld.name) {
                this.updateFormField(zoomFld.name, zoomFld[cpForm.cpFromField])
            }
        }
    }

});
