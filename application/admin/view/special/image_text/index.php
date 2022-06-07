{extend name="public/container"}
{block name="content"}
<div class="layui-fluid">
    <div class="layui-card">
        <div class="layui-card-header">图文专题</div>
        <div class="layui-card-body">
            <form class="layui-form layui-form-pane" action="">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">专题搜索</label>
                        <div class="layui-input-inline">
                            <input type="text" name="store_name" class="layui-input" autocomplete="off" placeholder="专题名称、简介、短语、编号">
                            <input type="hidden" name="activity_type" value="{$activity_type}">
                            <input type="hidden" name="subject_id" value="{$subject_id}">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">专题分类</label>
                        <div class="layui-input-inline">
                            <select name="subject_id" lay-search="">
                                <option value="0">全部</option>
                                {volist name='subject_list' id='vc'}
                                <option {if $vc.grade_id==0}disabled{/if} value="{$vc.id}">{$vc.html}{$vc.name}</option>
                                {/volist}
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">显示状态</label>
                        <div class="layui-input-inline">
                            <select name="is_show">
                                <option value="">全部</option>
                                <option value="1">显示</option>
                                <option value="0">隐藏</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">时间范围</label>
                        <div class="layui-input-inline" style="width: 260px;">
                            <input type="text" name="datetime" class="layui-input" id="datetime" placeholder="时间范围">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <div class="layui-input-inline">
                            <button class="layui-btn layui-btn-normal layui-btn-sm" lay-submit="search" lay-filter="search">
                                <i class="layui-icon layui-icon-search"></i>搜索
                            </button>
                        </div>
                    </div>
                </div>
            </form>
            <div class="layui-btn-container">
                <button type="button" class="layui-btn layui-btn-normal layui-btn-sm" data-type="add" onclick="action.open_add('{:Url('add',['special_type' =>$special_type])}','添加{$special_title}')">
                    <i class="layui-icon layui-icon-add-1"></i>添加{$special_title}
                </button>
                <button type="button" class="layui-btn layui-btn-normal layui-btn-sm" data-type="refresh" onclick="window.location.reload()">
                    <i class="layui-icon layui-icon-refresh-1"></i>刷新
                </button>
            </div>
            <table id="List" lay-filter="List"></table>
            <script type="text/html" id="recommend">
                <div class="layui-btn-container">
                {{#  layui.each(d.recommend, function(index, item){ }}
                <button type="button" class="layui-btn layui-btn-normal layui-btn-xs" data-type="recommend" data-id="{{index}}" data-pid="{{d.id}}">{{item}}</button>
                {{#  }); }}
                </div>
            </script>
            <script type="text/html" id="is_pink">
                {{# if(d.is_pink){ }}
                <span class="layui-badge layui-bg-blue">开启</span>
                {{# }else{ }}
                <span class="layui-badge">关闭</span>
                {{# } }}
            </script>
            <script type="text/html" id="is_live_goods">
                <input type='checkbox' name='is_live_goods' lay-skin='switch' value="{{d.id}}" lay-filter='is_live_goods' lay-text='是|否'  {{ d.is_live_goods == 1 ? 'checked' : '' }}>
            </script>
            <script type="text/html" id="is_show">
                <input type='checkbox' name='id' lay-skin='switch' value="{{d.id}}" lay-filter='is_show' lay-text='上架|下架'  {{ d.is_show == 1 ? 'checked' : '' }}>
            </script>
            <script type="text/html" id="image">
                <img style="cursor: pointer;" height="50" lay-event='open_image' src="{{d.image}}">
            </script>
            <script type="text/html" id="act">
                <button type="button" class="layui-btn layui-btn-normal layui-btn-xs" onclick="dropdown(this)">
                    <i class="layui-icon layui-icon-triangle-d"></i>操作
                </button>
                <ul class="layui-nav-child layui-anim layui-anim-upbit">
                    <li>
                        <a  href="javascript:void(0)" onclick="action.open_add('{:Url('add')}?id={{d.id}}&special_type={$special_type}','编辑专题')">
                            <i class="fa fa-paste"></i> 编辑专题
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)" onclick="$eb.createModalFrame('{{d.title}}-推荐管理','{:Url('recommend')}?special_id={{d.id}}',{h:300,w:400})">
                            <i class="fa fa-check-circle"></i> 推荐至首页
                        </a>
                    </li>
                    <li>
                        <a lay-event='delect' href="javascript:void(0)">
                            <i class="fa fa-trash"></i> 删除专题
                        </a>
                    </li>
                </ul>
            </script>
        </div>
    </div>
</div>
<script src="{__ADMIN_PATH}js/layuiList.js"></script>
{/block}
{block name="script"}
<script>
    var $ = layui.jquery;
    var layer = layui.layer;
    var special_type = {$special_type} ? {$special_type} : 6;
    //实例化form
    layList.form.render();
    layList.date({
        elem: '#datetime',
        type: 'datetime',
        range: '~'
    });
    //加载列表
    layList.tableList({o:'List', done:function () {
        $('.layui-btn').on('mouseover', function (event) {
            var target = event.target;
            var type = target.dataset.type;
            if ('recommend' === type) {
                layer.tips('点击即可取消此推荐', target, {
                    tips: [1, '#0093dd']
                });
            }
        });

        $('.layui-btn').on('mouseout', function (event) {
            var target = event.target;
            var type = target.dataset.type;
            if ('recommend' === type) {
                layer.closeAll();
            }
        });

        $('.layui-btn').on('click', function (event) {
            var target = event.target;
            var type = target.dataset.type;
            if ('recommend' === type) {
                var id = target.dataset.id;
                var pid = target.dataset.pid;
                var url = layList.U({ a: 'cancel_recommendation', q: { id: id, special_id: pid } });
                $eb.$swal(
                    'delete',
                    function () {
                        $eb.axios
                            .get(url)
                            .then(function (res) {
                                if (res.data.code == 200) {
                                    $eb.$swal('success', res.data.msg);
                                    layList.reload()
                                } else {
                                    return Promise.reject(res.data.msg || '取消失败');
                                }
                            })
                            .catch(function (err) {
                                $eb.$swal('error', err);
                            });
                    },
                    {
                        title: '确定取消此推荐？',
                        text: '取消后无法撤销，请谨慎操作！',
                        confirm: '确定取消'
                    }
                );
            }
        });
    }},"{:Url('list',['subject_id'=>$subject_id, 'special_type'=>$special_type])}",function (){
        return [
            {field: 'id', title: '编号', width:60,align: 'center'},
            {field: 'title', title: '名称'},
            {field: 'subject_name', title: '分类',align: 'center',width:75},
            {field: 'image', title: '封面',templet:'#image',align: 'center'},
            {field: 'recommend', title: '推荐',templet:'#recommend',align: 'center'},
            {field: 'money', title: '价格',align: 'center',width:70},
            {field: 'task_count', title: '课程数量',align: 'center',width:70},
            {field: 'sales', title: '销量',align: 'center',width:70},
            {field: 'sort', title: '排序',sort: true,event:'sort',edit:'sort',align: 'center',width:60},
            {field: 'is_show', title: '状态',templet:'#is_show',align: 'center',width:80},
            {field: 'right', title: '操作',align:'center',toolbar:'#act',width:70},
        ];
    });
    //下拉框
    $(document).click(function (e) {
        $('.layui-nav-child').hide();
    })
    function dropdown(that){
        var oEvent = arguments.callee.caller.arguments[0] || event;
        oEvent.stopPropagation();
        var offset = $(that).offset();
        var top=offset.top-$(window).scrollTop();
        var index = $(that).parents('tr').data('index');
        $('.layui-nav-child').each(function (key) {
            if (key != index) {
                $(this).hide();
            }
        })
        if($(document).height() < top+$(that).next('ul').height()){
            $(that).next('ul').css({
                'padding': 10,
                'top': - ($(that).parent('td').height() / 2 + $(that).height() + $(that).next('ul').height()/2),
                'min-width': 'inherit',
                'position': 'absolute'
            }).toggle();
        }else{
            $(that).next('ul').css({
                'padding': 10,
                'top':$(that).parent('td').height() / 2 + $(that).height(),
                'min-width': 'inherit',
                'position': 'absolute'
            }).toggle();
        }
    }
    //自定义方法
    var action= {
        set_value: function (field, id, value, model_type) {
            layList.baseGet(layList.Url({
                a: 'set_value',
                q: {field: field, id: id, value: value, model_type:model_type}
            }), function (res) {
                layList.msg(res.msg);
            });
        },
        //打开新添加页面
        open_add: function (url,title) {
            layer.open({
                type: 2 //Page层类型
                ,area: ['100%', '100%']
                ,title: title
                ,shade: 0.6 //遮罩透明度
                ,maxmin: true //允许全屏最小化
                ,anim: 1 //0-6的动画形式，-1不开启
                ,content: url
                ,end:function() {
                    location.reload();
                }
            });
        }
    };
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
            activity_type: where.activity_type,
            subject_id: where.subject_id,
            is_show: where.is_show,
            start_time: start_time,
            end_time: end_time,
            store_name: where.store_name
        },true);
    });
    layList.switch('is_show',function (odj,value) {
        var is_show_value = 0
        if(odj.elem.checked==true){
            var is_show_value = 1
        }
        action.set_value('is_show',value,is_show_value,'special');
    });
    //快速编辑
    layList.edit(function (obj) {
        var id=obj.data.id,value=obj.value;
        switch (obj.field) {
            case 'title':
                action.set_value('title',id,value,'special');
                break;
            case 'sort':
                if(value < 0) return layList.msg('排序不能小于0');
                action.set_value('sort',id,value,'special');
                break;
            case 'fake_sales':
                action.set_value('fake_sales',id,value,'special');
                break;
        }
    });
    //监听并执行排序
    layList.sort(['id','sort'],true);
    //点击事件绑定
    layList.tool(function (event,data,obj) {
        switch (event) {
            case 'delect':
                var url=layList.U({a:'delete',q:{id:data.id, model_type:'special'}});
                $eb.$swal('delete',function(){
                    $eb.axios.get(url).then(function(res){
                        if(res.status == 200 && res.data.code == 200) {
                            $eb.$swal('success',res.data.msg);
                           location.reload();
                        }else
                            return Promise.reject(res.data.msg || '删除失败')
                    }).catch(function(err){
                        $eb.$swal('error',err);
                    });
                })
                break;
                case 'turnTo':
                    layer.confirm('转至其他专题', {
                        btn: ['音频','视频','直播'], //按钮
                        btn1:function(){
                                var url=layList.U({a:'turnTo',q:{id:data.id, model_type:'special',type:2}});
                                $eb.axios.get(url).then(function(res){
                                    if(res.status == 200 && res.data.code == 200) {
                                        layer.msg(res.data.msg, {icon: 1});
                                        location.reload();
                                    }else
                                        return Promise.reject(res.data.msg || '转换失败')
                                }).catch(function(err){
                                    $eb.$swal('error',err);
                                });
                        },
                        btn2:function(){
                                var url=layList.U({a:'turnTo',q:{id:data.id, model_type:'special',type:3}});
                                $eb.axios.get(url).then(function(res){
                                    if(res.status == 200 && res.data.code == 200) {
                                        layer.msg(res.data.msg, {icon: 1});
                                        location.reload();
                                    }else
                                        return Promise.reject(res.data.msg || '转换失败')
                                }).catch(function(err){
                                    $eb.$swal('error',err);
                                });
                        },
                        btn3:function(){
                            var url=layList.U({a:'turnTo',q:{id:data.id, model_type:'special',type:4}});
                            $eb.axios.get(url).then(function(res){
                                if(res.status == 200 && res.data.code == 200) {
                                    layer.msg(res.data.msg, {icon: 1});
                                    location.reload();
                                }else
                                    return Promise.reject(res.data.msg || '转换失败')
                            }).catch(function(err){
                                $eb.$swal('error',err);
                            });
                        }
                    });
                break;
            case 'open_image':
                $eb.openImage(data.image);
                break;
        }
    })

</script>
{/block}

