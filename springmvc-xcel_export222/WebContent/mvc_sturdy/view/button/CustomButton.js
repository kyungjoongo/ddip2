Ext.define('mvc_study.view.button.CustomButton', {
    extend: 'Ext.button.Button',
    alias : 'widget.customButton',
    text : '내가만든버튼',
  /*  handler : function(){
        alert("클릭!!");
    },*/
    initComponent: function() {
        this.callParent();
    }
});
