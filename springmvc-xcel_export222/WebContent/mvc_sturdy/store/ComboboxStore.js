Ext.define('mvc_study.store.ComboboxStore', {
    extend: 'Ext.data.Store',
    model: 'mvc_study.model.ComboboxModel',
    data : [{
        title : '타이틀1',
        value : '값1'
    },{
        title : '타이틀2',
        value : '값2'
    },{
        title : '타이틀3',
        value : '값3'
    },{
        title : '타이틀4',
        value : '값4'
    }],
    proxy: {
        type: 'memory'
    }
});
