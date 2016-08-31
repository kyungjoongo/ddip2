Ext.define('mvc_study.controller.MvcController', {
    extend: 'Ext.app.Controller',
    views: ['button.CustomButton'],
    refs: [
        {
            ref: 'customButton',
            selector: 'customButton'
        }
    ],
    init: function() {
        this.control({
            'customButton': {
                click: this.showAlert
            }  
        });
    },
    showAlert : function(){
        alert("출력");
    }
});