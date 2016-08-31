Ext.define('mvc_study.view.combo.CustomCombo', {
    extend: 'Ext.form.field.ComboBox',
    alias : 'widget.customCombo',
    fieldLabel: '선택',
    store: 'ComboboxStore',
    queryMode: 'local',
    displayField: 'title',
    valueField: 'value',
    initComponent: function() {
        this.callParent();
    }
});