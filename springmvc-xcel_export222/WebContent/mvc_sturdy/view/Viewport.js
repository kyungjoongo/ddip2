Ext.define('mvc_study.view.Viewport', {
    extend: 'Ext.container.Viewport',
    items : [{
        xtype : 'customButton'
    }],
    initComponent: function() {
        this.callParent();
    }
});