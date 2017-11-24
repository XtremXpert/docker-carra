/*jslint nomen: true, sloppy : true, white : true, sub : true */
/*global Ext */
/*global _SM */

Ext.define('Softmachine.view.smmasterdetail.MDActionsController', {
    extend: 'Ext.Base',
    myMeta: null,

    requires : [
        'ProtoUL.ux.ParameterWin'
    ], 

    constructor: function(config) {
        Ext.apply(this, config || {});
        this.getProtoActionsBar();
    },

    getProtoActionsBar: function() {

        var vCode = this.myMeta.viewCode; 
        if ( vCode.slice(-1) == '.' ) { 
            this.myMeta.viewCode = vCode.substr(0, vCode.length - 1);
        }
   	    	    	
        var perms = _SM._UserInfo.perms[this.myMeta.viewCode];
        if (!(perms['add'] || perms['change'] || perms['delete'])) {
            return;
        }
        // if ( ! _SM._UserInfo.isStaff ) return

        // @formatter:off
        var me = this, ix, pProtoAction,
            myProtoActions = [],  
            __MasterDetail = this.__MasterDetail;
        // @formatter:on

        if (this.myMeta.WFlowActions) {
            for (ix in this.myMeta.WFlowActions ) {
                pProtoAction = this.myMeta.WFlowActions[ix];

                pProtoAction.menuText = pProtoAction.menuText || pProtoAction.name;
                pProtoAction.actionType = 'wflow';
                pProtoAction.selectionMode = 'multiple';
                pProtoAction.refreshOnComplete = true;

                if (pProtoAction.admMessagePropmt) {
                    pProtoAction.actionParams = [{
                        'name': 'admMessage',
                        'tooltip': pProtoAction.description,
                        'fieldLabel': pProtoAction.admMessagePropmt,
                        'type': 'string',
                        'required': true
                    }];

                } else {
                    pProtoAction.actionParams = [];
                }

                myProtoActions.push(new Ext.Action({
                    text: pProtoAction.menuText,
                    actionName: pProtoAction.name,
                    iconCls: pProtoAction.viewIcon,
                    tooltip: pProtoAction.description,
                    actionDef: pProtoAction,
                    scope: me,
                    handler: onClickDoAction
                }));
            };

        }

        for ( ix in this.myMeta.actions  ) {
            pProtoAction = this.myMeta.actions[ix];
            pProtoAction.menuText = pProtoAction.menuText || pProtoAction.name;
            myProtoActions.push(new Ext.Action({
                text: pProtoAction.menuText,
                actionName: pProtoAction.name,
                iconCls: pProtoAction.viewIcon,
                tooltip: pProtoAction.description,
                actionDef: pProtoAction,
                scope: me,
                handler: onClickDoAction
            }));
        };

        if (myProtoActions.length > 0) {

            // __MasterDetail.tbProtoActions = Ext.create('Ext.toolbar.Toolbar', {
            //     dock: 'top',
            //     hidden: true,
            //     enableOverflow: true,
            //     items: [{
            //         xtype: 'tbtext',
            //         text: '<strong>Actions :</strong>'
            //     }]
            // });

            // __MasterDetail.tbProtoActions.add(myProtoActions);
            // __MasterDetail.protoMasterGrid.addDocked(__MasterDetail.tbProtoActions);
            __MasterDetail.myProtoActions = myProtoActions;

        };

        function onClickDoAction(btn) {

            var pGrid = __MasterDetail.protoMasterGrid;
            var selectedKeys = pGrid.getSelectedIds();
            var pAction = btn.actionDef;
            var myOptions, myWin;
            var detKeys = {};

            // "selectionMode",
            if ((pAction.selectionMode == "single"  ) && (selectedKeys.length != 1 )) {
                _SM.vp_StatusBar.showMessage('TITLE_ACTION_SELECTION_SINLGLE', btn.actionName, 3000);
                return;

            } else if ((pAction.selectionMode == "optional"  ) && (selectedKeys.length > 1 )) {
                _SM.vp_StatusBar.showMessage('TITLE_ACTION_SELECTION_OPTIONAL', btn.actionName, 3000);
                return;

            } else if ((pAction.selectionMode == "multiple"  ) && (selectedKeys.length < 1 )) {
                _SM.vp_StatusBar.showMessage('TITLE_ACTION_SELECTION_MULTI', btn.actionName, 3000);
                return;

            } else if (pAction.selectionMode == "details"  ) {

                for (ix in this.__MasterDetail.protoTabs.items.items ) {
                    pdetGrid = this.__MasterDetail.protoTabs.items.items[ix];
                    detKeys[ pdetGrid.detailDefinition.detailName ]  = pdetGrid.getSelectedIds();
                }
            }

            // actionParams
            pAction.actionParams = _SM.verifyList(pAction.actionParams);
            if (pAction.executeJS){
            	eval(pAction.jsCode);
            } else {
                if (pAction.actionParams.length == 0) {
                	this.doAction(me, pGrid.viewCode, btn.actionDef, selectedKeys, [], detKeys);
            	} else {
                	myOptions = {
                    	scope: me,
                    	acceptFn: function(parameters) {
                        	this.doAction(me, pGrid.viewCode, btn.actionDef, selectedKeys, parameters, detKeys);
                    	}

                	};

                    
                    myWin = Ext.create('ProtoUL.ux.ParameterWin', {
                        parameters: pAction.actionParams,
                        title: btn.actionName,
                        requestparams : {
                            viewCode : pGrid.viewCode,
                            actionName : btn.actionName,

                            // name, required, tooltype, type 
                            parameters : Ext.encode(pAction.parameters),
                            actionDef : Ext.encode(btn.actionDef),

                            // User Selection 
                            selectedKeys : Ext.encode(selectedKeys), 
                            detKeys : Ext.encode(detKeys)
                        },

                        options: myOptions
                    });

                    myWin.show();

                };
            }
        };

    },

    doAction: function(me, viewCode, actionDef, selectedKeys, parameters, detKeys) {

        var options = {
            scope: me,
            success: function(result, request) {
                var myResult = Ext.decode(result.responseText);
                _SM.vp_StatusBar.showMessage(actionDef.name + ' ' + myResult.message, 'MDActionsController', 3000);

                if (myResult.success && actionDef.refreshOnComplete) {
                    this.__MasterDetail.mdGridReload();
                }

                if (myResult.fileName) {
                    _SM.getFile(myResult.fileName, true);
                }

            },
            failure: function(result, request) {
                _SM.errorMessage(actionDef.name + ' ' + result.statusText, 'MDActionsController');

            }

        };


        if ( actionDef.actionConfirm ) { 
            Ext.MessageBox.confirm( _SM.__language.Title_Action_Confirm, 
                _SM.__language.Msg_Action_Confirm, 
                doFireAction );
        } else { 
            doFireAction('yes')
        }

        function doFireAction(btn){
            if (btn === 'yes') {
                _SM.vp_StatusBar.showMessage('executing  ' + actionDef.name + '...', 'MDActionsController');
                _SM.doProtoActions(viewCode, actionDef.name, selectedKeys, detKeys, parameters, actionDef, options);
            }
        }



    }

});