{extend name="public/container"}
{block name="content"}
<div class="layui-fluid">
    <div class="layui-row layui-col-space15"  id="app">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">搜索条件</div>
                <div class="layui-card-body">
                    <form class="layui-form layui-form-pane" action="">
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">时间范围</label>
                                <div class="layui-input-inline" style="width: 260px;">
                                    <input type="text" name="datetime" class="layui-input" id="datetime" placeholder="时间范围">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">用户名称</label>
                                <div class="layui-input-block">
                                    <input type="text" name="nickname" class="layui-input" placeholder="请输入用户名称">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <button class="layui-btn layui-btn-sm layui-btn-normal" lay-submit="search" lay-filter="search">
                                        <i class="layui-icon layui-icon-search"></i>搜索</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--产品列表-->
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">评论列表</div>
                <div class="layui-card-body">
                    <div class="layui-btn-container">
                        <button class="layui-btn layui-btn-normal layui-btn-sm" onclick="window.location.reload()"><i class="layui-icon layui-icon-refresh"></i>  刷新</button>
                    </div>
                    <table class="layui-hide" id="List" lay-filter="List"></table>
                    <script type="text/html" id="is_show">
                        <input type='checkbox' name='id' lay-skin='switch' value="{{d.id}}" lay-filter='is_show' lay-text='显示|隐藏'  {{ d.is_show == 1 ? 'checked' : '' }}>
                    </script>
                    <script type="text/html" id="avatar">
                        <img style="cursor: pointer;width: 80px;height: 40px;" lay-event='open_image' src="{{d.avatar}}">
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="{__ADMIN_PATH}js/layuiList.js"></script>
{/block}
{block name="script"}
<script>
    var live_id='{$live_id}';
    //实例化form
    layList.form.render();
    layList.date({
        elem: '#datetime',
        theme: '#0092DC',
        type: 'datetime',
        range: '~'
    });
    //加载列表
    layList.tableList('List',"{:Url('get_live_comment_list')}?live_id={$live_id}",function (){
        return [
            {field: 'avatar', title: '头像',align:"center",templet:'#avatar'},
            {field: 'nickname', title: '昵称',align:"center"},
            {field: 'type_name', title: '身份',align:"center"},
            {field: 'barrage', title: '评论内容',align:'center',width:'20%'},
            {field: 'is_show', title: '状态',align:'center',templet:'#is_show'},
            {field: 'add_time', title: '发布时间',align:'center'},
        ];
    });
    layList.form.on('radio(is_playback)', function(data){
        layList.baseGet(layList.U({a:'set_value',q:{stream_name:stream_name,field:'is_playback',value:data.value}}),function (res) {
            layList.msg(res.msg);
        },function (res) {
            layList.msg(res.msg);
        })
    });
    //自定义方法
    var action= {
        set_value: function (field, id, value) {
            layList.baseGet(layList.Url({
                a: 'set_value',
                q: {field: field, id: id, value: value}
            }), function (res) {
                layList.msg(res.msg);
            });
        },
    }
    //查询
    layList.search('search',function(where){
        var arr_time = [];
        var start_time = '';
        var end_time = '';
        if (where.datetime) {
            arr_time = where.datetime.split('~');
            start_time = arr_time[0].trim();
            end_time = arr_time[1].trim();
        }
        layList.reload({
            start_time: start_time,
            end_time: end_time,
            nickname: where.nickname
        },true);
    });
    layList.switch('is_show',function (odj,value) {
        if(odj.elem.checked==true){
            layList.baseGet(layList.Url({a:'set_show_comment',p:{is_show:1,id:value}}),function (res) {
                layList.msg(res.msg);
            });
        }else{
            layList.baseGet(layList.Url({a:'set_show_comment',p:{is_show:0,id:value}}),function (res) {
                layList.msg(res.msg);
            });
        }
    });
    //快速编辑
    layList.edit(function (obj) {
        var id=obj.data.id,value=obj.value;
        switch (obj.field) {
            case 'course_name':
                action.set_value('course_name',id,value);
                break;
            case 'sort':
                if(value < 0) return layList.msg('排序不能小于0');
                action.set_value('sort',id,value);
                break;
        }
    });
    //监听并执行排序
    layList.sort(['id','sort'],true);
    //点击事件绑定
    layList.tool(function (event,data,obj) {
        switch (event) {
            case 'delete':
                var url=layList.U({a:'del_guest',q:{id:data.id}});
                $eb.$swal('delete',function(){
                    $eb.axios.get(url).then(function(res){
                        if(res.status == 200 && res.data.code == 200) {
                            $eb.$swal('success',res.data.msg);
                            obj.del();
                        }else
                            return Promise.reject(res.data.msg || '删除失败')
                    }).catch(function(err){
                        $eb.$swal('error',err);
                    });
                });
                break;
            case 'look':
                $eb.createModalFrame('直播间号【'+stream_name+'】的直播回放,回放时间：'+data.StartTime+' - '+data.EndTime,layList.U({a:'live_record_look',q:{record_url:data.RecordUrl}}),{w:890,h:450});
                break;
            case 'download':
                $eb.createModalFrame('直播间号【'+stream_name+'】的直播下载',layList.U({a:'download',q:{record_url:data.RecordUrl}}),{w:900});
                break;
            case 'set_record':
                var url = layList.U({a:'set_value',q:{stream_name:stream_name,field:'playback_record_id',value:data.RecordId}});
                $eb.$swal('delete',function(){
                    $eb.axios.get(url).then(function(res){
                        if(res.status == 200 && res.data.code == 200) {
                            $eb.$swal('success',res.data.msg);
                        }else
                            return Promise.reject(res.data.msg || '删除失败')
                    }).catch(function(err){
                        $eb.$swal('error',err);
                    });
                },{title:'设置为直播间回放',text:'设置成功后，没有开启直播将自动播放此回放',confirm:'是的，我要设置'});
                break;
            case 'del_record':
                var url = layList.U({a:'set_value',q:{stream_name:stream_name,field:'playback_record_id',value:''}});
                $eb.$swal('delete',function(){
                    $eb.axios.get(url).then(function(res){
                        if(res.status == 200 && res.data.code == 200) {
                            $eb.$swal('success',res.data.msg);
                        }else
                            return Promise.reject(res.data.msg || '删除失败')
                    }).catch(function(err){
                        $eb.$swal('error',err);
                    });
                },{title:'取消直播间回放',text:'设置成功后，没有开启直播将不会回放',confirm:'是的，我要取消'});
                break;
        }
    })
</script>
{/block}
