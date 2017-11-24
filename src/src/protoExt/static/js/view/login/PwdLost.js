Ext.define('Softmachine.view.login.PwdLost', {
    extend : 'Ext.window.Window',
    alias : 'widget.pwdLostForm',

    title : _SM.__language.Title_Window_Email_Request,
    iconCls : 'st-user-who',

    floating : true,
    closable : true,
    modal : true,
    width : 450,
    height : 200,
    bodyPadding : 5,
    labelWidth : 160,

    // Fields will be arranged vertically, stretched to full width
    layout : 'anchor',
    defaults : {
        anchor : '100%',
        enableKeyEvents : true
    },

    controller : 'login',

    items : {
        xtype : 'form',
        bodyPadding : 25,
        centered : true,

        fieldDefaults : {
            anchor : '100%',
            labelAlign : 'left',
            allowBlank : false,
            combineErrors : true,
            msgTarget : 'side',
            labelWidth : 80
        },
        items : [
            {
                xtype : 'textfield',
                fieldLabel : _SM.__language.Textfield_User_Login,
                name : 'login',
                allowBlank : false,
                flex : 1,
            },
            {
                xtype : 'textfield',
                fieldLabel : _SM.__language.Textfield_User_Email,
                name : 'email',
                vtype : 'email',
                allowBlank : false,
                flex : 1,
            }
        ],

        // Reset and Submit buttons
        buttons : [
            {
                text : _SM.__language.Text_Send_Button,
                itemId : 'btPwdLostSubmit',
                iconCls : 'st-key-go',
                formBind : true,
                disabled : true,

                listeners : {
                    click : 'doPwdRecovery'
                }

            }
        ],
    }

});
