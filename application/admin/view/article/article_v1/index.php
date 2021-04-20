{extend name="public/container"}
{block name="content"}
<div class="layui-fluid">
    <div class="layui-row layui-col-space15"  id="app">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">
                    <div style="font-weight: bold;">新闻列表</div>
                </div>
                <div class="layui-card-body">
                    <div class="layui-row layui-col-space15">
                        <div class="layui-col-md12">
                            <form class="layui-form layui-form-pane" action="">
                                <div class="layui-form-item">
                                    <div class="layui-inline">
                                        <label class="layui-form-label">新闻名称</label>
                                        <div class="layui-input-inline">
                                            <input type="text" name="store_name" class="layui-input" placeholder="请输入新闻名称">
                                            <input type="hidden" name="type" value="{$type}">
                                        </div>
                                    </div>
                                    <div class="layui-inline">
                                        <label class="layui-form-label">分类</label>
                                        <div class="layui-input-inline">
                                        <select name="cid" aria-controls="editable" class="form-control input-sm">
                                            <option value="">所有分类</option>
                                            {volist name="cate" id="vo"}
                                            <option value="{$vo.id}" {eq name="cid" value="$vo.id"}selected="selected"{/eq}>{$vo.html}{$vo.title}</option>
                                            {/volist}
                                        </select>
                                        </div>
                                    </div>
                                    <div class="layui-inline">
                                        <label class="layui-form-label">是否显示</label>
                                        <div class="layui-input-inline">
                                            <select name="is_show">
                                                <option value="">全部</option>
                                                <option value="1">显示</option>
                                                <option value="0">隐藏</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="layui-inline">
                                        <div class="layui-input-inline">
                                            <button type="button" class="layui-btn layui-btn-sm layui-btn-normal" lay-submit="search" lay-filter="search">
                                                <i class="layui-icon">&#xe615;</i>搜索
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="layui-col-md12">
                            <div class="layui-btn-group">
                                <button type="button" class="layui-btn layui-btn-sm layui-btn-normal" onclick="action.open_add('{:Url('add_article',['type'=>2])}','添加新闻')">
                                    <i class="layui-icon">&#xe608;</i>添加新闻
                                </button>
                                <button type="button" class="layui-btn layui-btn-sm layui-btn-normal" onclick="window.location.reload();">
                                    <i class="layui-icon">&#xe669;</i>刷新
                                </button>
                            </div>
                            <table class="layui-hide" id="List" lay-filter="List"></table>
                            <script type="text/html" id="recommend">
                            <div class="layui-btn-container">
                                {{#  layui.each(d.recommend, function(index, item){ }}
                                <button type="button" class="layui-btn  layui-btn-normal layui-btn-xs" data-type="recommend" data-id="{{index}}" data-pid="{{d.id}}">{{item}}</button>
                                {{#  }); }}
                                </div>
                            </script>
                            <script type="text/html" id="is_show">
                                <input type='checkbox' name='id' lay-skin='switch' value="{{d.id}}" lay-filter='is_show' lay-text='显示|隐藏'  {{ d.is_show == 1 ? 'checked' : '' }}>
                            </script>
                            <script type="text/html" id="image_input">
                                <img style="cursor: pointer;" height="50" lay-event='open_image' src="{{d.image_input}}">
                            </script>
                            <script type="text/html" id="recommend">
                                {{#  layui.each(d.recommend, function(index, item){ }}
                                <span class="layui-badge layui-bg-blue recom-item" data-id="{{index}}" data-pid="{{d.id}}" style="margin-bottom: 5px;">{{item}}</span>
                                {{#  }); }}
                            </script>
                            <script type="text/html" id="act">
                                <button type="button" class="layui-btn layui-btn-normal layui-btn-xs" onclick="$eb.createModalFrame('{{d.title}}-推荐管理','{:Url('recommend')}?article_id={{d.id}}',{h:300,w:400})">
                                    <i class="layui-icon">&#xe604;</i>推荐
                                </button>
                                <button type="button" class="layui-btn layui-btn-normal layui-btn-xs" onclick="action.open_add('{:Url('add_article',['type'=>2])}?id={{d.id}}','新闻编辑')">
                                    <i class="layui-icon">&#xe642;</i>编辑
                                </button>
                                <button type="button" class="layui-btn layui-btn-danger layui-btn-xs" lay-event='delete'>
                                    <i class="layui-icon">&#xe640;</i>删除
                                </button>
                            </script>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="{__ADMIN_PATH}js/layuiList.js"></script>
{/block}
{block name="script"}
<script>
    //实例化form
    layList.form.render();
    //加载列表
    layList.tableList({
        o: 'List',
        done: function () {
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
                    var url = layList.U({ a: 'cancel_recommendation', q: { id: id, article_id: pid } });
                    $eb.$swal(
                        'delete',
                        function () {
                            $eb.axios
                                .get(url)
                                .then(function (res) {
                                    if (res.data.code == 200) {
                                        $eb.$swal('success', res.data.msg);
                                        layList.reload();
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
        }
    },"{:Url('article_list',['cid'=>$cid])}",function (){
        return [
            {field: 'id', title: '编号', width:60,align: 'center'},
            {field: 'title', title: '标题'},
            {field: 'cate_name', title: '分类',align: 'center'},
            {field: 'image_input', title: '封面',templet:'#image_input',align: 'center'},
            {field: 'recommend', title: '推荐',templet:'#recommend',align: 'center'},
            {field: 'sort', title: '排序',align: 'center'},
            {field: 'is_show', title: '状态',templet:'#is_show',align: 'center'},
            {field: 'right', title: '操作',align:'center',toolbar:'#act'},
        ];
    });
    //下拉框
    $(document).click(function (e) {
        $('.layui-nav-child').hide();
    });
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
        set_value: function (field, id, value) {
            layList.baseGet(layList.Url({
                a: 'set_value',
                q: {field: field, id: id, value: value}
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
    }
    //查询
    layList.search('search',function(where){
        layList.reload(where,true);
    });
    layList.switch('is_show',function (odj,value) {
        if(odj.elem.checked==true){
            layList.baseGet(layList.Url({a:'set_show',p:{is_show:1,id:value}}),function (res) {
                layList.msg(res.msg);
            });
        }else{
            layList.baseGet(layList.Url({a:'set_show',p:{is_show:0,id:value}}),function (res) {
                layList.msg(res.msg);
            });
        }
    });
    //快速编辑
    layList.edit(function (obj) {
        var id=obj.data.id,value=obj.value;
        switch (obj.field) {
            case 'title':
                action.set_value('title',id,value);
                break;
            case 'sort':
                action.set_value('sort',id,value);
                break;
            case 'fake_sales':
                action.set_value('fake_sales',id,value);
                break;
        }
    });
    //监听并执行排序
    layList.sort(['id','sort'],true);
    //点击事件绑定
    layList.tool(function (event,data,obj) {
        switch (event) {
            case 'delete':
                var url=layList.U({a:'delete',q:{id:data.id}});
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
            case 'open_image':
                $eb.openImage(data.image_input);
                break;
        }
    })
</script>
{/block}

