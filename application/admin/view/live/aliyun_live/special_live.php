{extend name="public/container"}
{block name='head_top'}
<style>
    .go-live{width: 100%;background-color: #eeeeee;display: none;}
    .go-live .live-box{padding: 10px 0 10px 30px;background-color: #ffffff;border-radius: 5px;margin-top: 30px;}
    .go-live .live-box .live-text{font-size: 15px;color: #0092DC;margin: 5px;padding: 10px 0;}
    .go-live .live-box .live-title{text-align: center;}
    .go-live .live-box .live-text p{color:#333333;padding:10px;display: inline-block;width: 80%;background-color: #eeeeee;border-radius: 10px;}
    .go-live .live-box .live-text label{width: 8%;}
</style>
{/block}
{block name="content"}
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body">
                    <div class="layui-row layui-col-space15"  id="app">
                        <div class="layui-col-md12">
                            <div class="layui-tab layui-tab-brief" lay-filter="tab">
                                <ul class="layui-tab-title">
                                    <li lay-id="list" {eq name='type' value='1'}class="layui-this" {/eq} >
                                        <a href="{eq name='type' value='1'}javascript:;{else}{:Url('special_live',['special_type'=>4,'type'=>1])}{/eq}">直播列表</a>
                                    </li>
                                    <li lay-id="list" {eq name='type' value='2'}class="layui-this" {/eq}>
                                        <a href="{eq name='type' value='2'}javascript:;{else}{:Url('index',['special_type'=>4,'type'=>2])}{/eq}">直播间管理</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="layui-col-md12">
                            <form class="layui-form layui-form-pane" action="">
                                <div class="layui-form-item">
                                    <div class="layui-inline">
                                        <label class="layui-form-label">直播搜索</label>
                                        <div class="layui-input-inline">
                                            <input type="text" name="store_name" class="layui-input" placeholder="直播标题、简介、短语、编号">
                                            <input type="hidden" name="type" value="{$type}">
                                            <input type="hidden" name="subject_id" value="{$subject_id}">
                                        </div>
                                    </div>
                                    <div class="layui-inline">
                                        <label class="layui-form-label">课程分类</label>
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
                                            <button type="button" class="layui-btn layui-btn-sm layui-btn-normal" lay-submit="search" lay-filter="search">
                                                <i class="layui-icon">&#xe615;</i>搜索
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!--产品列表-->
                        <div class="layui-col-md12">
                            <div class="layui-btn-group">
                                <button type="button" class="layui-btn layui-btn-normal layui-btn-sm" onclick="action.open_add('{:Url('/admin/special.special_type/add',['special_type' =>$special_type])}','添加{$special_title}')">
                                    <i class="layui-icon">&#xe608;</i>添加{$special_title}
                                </button>
                                <button type="button" class="layui-btn layui-btn-normal layui-btn-sm" onclick="window.location.reload()">
                                    <i class="layui-icon">&#xe669;</i>刷新
                                </button>
                            </div>
                            <table class="layui-hide" id="List" lay-filter="List"></table>
                            <script type="text/html" id="recommend">
                                <div class="layui-btn-container">
                                {{#  layui.each(d.recommend, function(index, item){ }}
                                <!-- <span class="layui-badge layui-bg-blue recom-item" data-id="{{index}}" data-pid="{{d.id}}">{{item}}</span> -->
                                <button type="button" class="layui-btn  layui-btn-normal layui-btn-xs" data-type="recommend" data-id="{{index}}" data-pid="{{d.id}}">{{item}}</button>
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
                            <script type="text/html" id="is_show">
                                <input type='checkbox' name='id' lay-skin='switch' value="{{d.id}}" lay-filter='is_show' lay-text='显示|隐藏'  {{ d.is_show == 1 ? 'checked' : '' }}>
                            </script>
                            <script type="text/html" id="image">
                                <img style="cursor: pointer;" height="50" lay-event='open_image' src="{{d.image}}">
                            </script>
                            <script type="text/html" id="act">
                                <button type="button" class="layui-btn layui-btn-normal layui-btn-xs" onclick="dropdown(this)">
                                  <i class="layui-icon">&#xe625;</i>操作
                                </button>
                                <ul class="layui-nav-child layui-anim layui-anim-upbit">
                                    <li>
                                        <a href="javascript:void(0)" onclick="action.open_add('{:Url('/admin/special.special_type/add')}?id={{d.id}}&special_type={$special_type}','编辑直播')" >
                                            <i class="fa fa-paste"></i> 编辑直播
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0)" lay-event='go_live'>
                                            <i class="fa fa-video-camera"></i> 去直播
                                        </a>
                                    </li>
                                    {if condition='isset($login_role["sign"]) && $login_role["sign"] eq "admin"'}
                                    <li>
                                        <a href="javascript:void(0)" lay-event='move_live_admin'>
                                            <i class="fa fa-street-view"></i> 直播间转让
                                        </a>
                                    </li>
                                    {/if}
                                    <li>
                                        <a href="javascript:void(0)" onclick="$eb.createModalFrame('{{d.title}}-推荐管理','{:Url('special.special_type/recommend')}?special_id={{d.id}}',{h:300,w:400})">
                                            <i class="fa fa-check-circle"></i> 推荐至首页
                                        </a>
                                    </li>
                                    {{# if(d.is_play){ }}
                                    <li>
                                        <a lay-event='recommend' href="javascript:void(0)">
                                            <i class="fa fa-check-circle"></i> 首页弹窗
                                        </a>
                                    </li>
                                    {{# } }}
                                    <li>
                                        <a href="javascript:void(0)" onclick="$eb.createModalFrame('{{d.title}}-直播回放','{:Url('download_list')}?special_id={{d.id}}',{w:1200})">
                                            <i class="fa fa-cloud-download"></i> 直播回放
                                        </a>
                                    </li>

                                    <li>
                                        <a lay-event='delect' href="javascript:void(0)">
                                            <i class="fa fa-trash"></i> 删除直播
                                        </a>
                                    </li>
                                </ul>
                            </script>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="go-live">
    <div class="live-box">
        <div class="live-title">
            <h2>直播推流地址</h2>
        </div>
        <div class="live-text">
            <label>服务器</label>
            <p id="live-href"></p>
            <button type="button" class="layui-btn layui-btn-normal copy" data-id="live-href">复制</button>
        </div>
        <div class="live-text">
            <label>串流密钥</label>
            <p id="live-code"></p>
            <button type="button" class="layui-btn layui-btn-normal copy" data-id="live-code">复制</button>
        </div>
    </div>
</div>

<div class="move_live_admin" hidden>
    <div style="padding: 20px; background-color: #F2F2F2;">
        <div class="layui-row layui-col-space15">
            <div class="layui-col-md12">
                <div class="layui-card">
                    <div class="layui-card-body">
                        <form class="layui-form" action="" lay-filter="admin_lists">
                            <div class="layui-form-item">
                                <label class="layui-form-label">管理用户：</label>
                                <div class="layui-input-block">
                                    <select name="admin_id" lay-filter="admin_id" id="admin_id">
                                        <option value="">全部</option>
                                        {volist name='admin_list' id='item'}
                                        <option value="{$item.admin_id}">{$item.admin_name}</option>
                                        {/volist}
                                    </select>
                                </div>
                            </div>
                        </form>
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
    var $ = layui.jquery;
    var layer = layui.layer;
    //实例化form
    layList.form.render();
    layList.date({
        elem: '#datetime',
        theme: '#0092DC',
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
                var url = layList.U({ a: '../special.special_type/cancel_recommendation', q: { id: id, special_id: pid } });
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
    }},"{:Url('special_list',['subject_id'=>$subject_id, 'special_type'=>$special_type])}",function (){
        return [
            {field: 'id', title: '编号', width:60,align: 'center'},
            {field: 'title', title: '直播标题',align: 'center'},
            {field: 'subject_name', title: '分类',align: 'center',width:75},
            {field: 'admin_name', title: '账号',align: 'center',width:85},
            {field: 'image', title: '封面',templet:'#image',align: 'center'},
            {field: 'recommend', title: '推荐',templet:'#recommend',align: 'center'},
            {field: 'browse_count', title: '浏览量',align: 'center',width:60},
            {field: 'stream_name', title: '直播间ID',align: 'center',width:75},
            {field: 'money', title: '价格',align: 'center',width:65},
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
                c: 'special.special_type' ,
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
        },
        //直播间转移
        move_live_admin: function(data){
                    layer.open({
                    type: 1
                    ,scrollbar: true
                    ,area: ['500px', '70%']
                    ,content: $('.move_live_admin')
                    ,btn: '转让'
                    ,btnAlign: 'c' //按钮居中
                    ,shade: 0 //不显示遮罩
                    ,yes: function(){
                       var admin_id = $("#admin_id").val();
                       if (!admin_id) {
                           layer.msg("请选择转让账号", {
                               icon: 2,
                               time: 2000
                           });
                           return false;
                       }
                        layList.baseGet(layList.U({a:'move_live_admin',q:{special_id:data.id, admin_id:admin_id}}),function(res){
                            if (res.code == 200) {
                                layer.closeAll();
                                layer.msg("转让成功", {
                                    icon: 1,
                                    time: 2000
                                });
                            }else{
                                layer.closeAll();
                                layer.msg("转让失败", {
                                    icon: 2,
                                    time: 2000
                                });
                            }
                        }, function (res) {
                            layer.msg(res.msg, {
                                icon: 2,
                                time: 2000
                            });
                        })
                    }
                    ,cancel:function () {
                        $('.live_remind').hide();
                    }
                });
        }
    }
    $('.copy').each(function () {
        $(this).on('click',function () {
            copy($(this).data('id'),function () {
                layList.msg('复制成功');
            });
        });
    })
    function copy (id, attr,errorFn)
    {
        var target = null,successFn=null;
        if(typeof attr=='function'){
            successFn=attr;
            attr='';
        }
        if (attr && typeof attr=='string') {
            target = document.createElement('div');
            target.id = 'tempTarget';
            target.style.opacity = '0';
            if (id) {
                var curNode = document.querySelector('#' + id);
                target.innerText = curNode[attr];
            } else {
                target.innerText = attr;
            }
            document.body.appendChild(target);
        } else {
            target = document.querySelector('#' + id);
        }

        try {
            var range = document.createRange();
            range.selectNode(target);
            window.getSelection().removeAllRanges();
            window.getSelection().addRange(range);
            document.execCommand('copy');
            window.getSelection().removeAllRanges();
            successFn && successFn();
        } catch (e) {
            errorFn && errorFn();
        }

        if (attr) {
            target.parentElement.removeChild(target);
        }
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
            case 'online_num':
                layList.baseGet(layList.Url({
                    c: 'live.aliyun_live' ,
                    a: 'set_value',
                    q: {stream_name: obj.data.stream_name,field:'online_num',value: value}
                }), function (res) {
                    layList.msg(res.msg);
                });
                break;
        }
    });
    //监听并执行排序
    layList.sort(['id','sort'],true);
    //点击事件绑定
    layList.tool(function (event,data,obj) {
        switch (event) {
            case 'delect':
                var url=layList.U({a:'delete',q:{id:data.id}});
                $eb.$swal('delete',function(){
                    $eb.axios.get(url).then(function(res){
                        if(res.status == 200 && res.data.code == 200) {
                            $eb.$swal('success','删除成功！');
                            obj.del();
                        }else
                            return Promise.reject(res.data.msg || '删除失败')
                    }).catch(function(err){
                        $eb.$swal('error',err);
                    });
                })
                break;
                case 'recommend':
                var url=layList.U({a:'recommend',q:{id:data.id}});
                    $eb.$swal('delete',function(){
                        $eb.axios.get(url).then(function(res){
                            if(res.status == 200 && res.data.code == 200) {
                                $eb.$swal('success',res.data.msg);
                                obj.update({is_publish:1});
                            }else
                                return Promise.reject(res.data.msg || '删除失败')
                        }).catch(function(err){
                            $eb.$swal('error',err);
                        });
                    },{title:"确认要把该直播专题推荐到首页弹窗吗?",text:'确认后无法修改',confirm:'确认'});
                break;
            case 'open_image':
                $eb.openImage(data.image);
                break;
            case 'go_live':
                layList.baseGet(layList.U({a:'go_live',q:{id:data.id}}),function(res){
                    $('#live-href').text(res.data.href);
                    $('#live-code').text(res.data.code);
                    layList.layer.open({
                        type: 1,
                        area: ['800px', 'auto'], //宽高
                        content:$('.go-live'),
                        title:false,
                        cancel:function () {
                            $('.go-live').hide();
                        }
                    });
                },function (res) {
                    layList.msg(res.msg);
                });
                break;
            case 'move_live_admin':
                action.move_live_admin(data);
        }
    })
</script>
{/block}
