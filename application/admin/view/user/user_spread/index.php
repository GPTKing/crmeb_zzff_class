{extend name="public/container"}
{block name="head_top"}
<style>
    .option{width: 200px;padding: 10px;background-color: #eeeeee;border-radius: 10px;text-align: center;display: none;}
    .option .layui-box p{margin: 5px 0;background-color: #ffffff;color: #0092DC;padding: 8px;cursor: pointer}
    .option .layui-box p.on{color: #eeeeee}
</style>
{/block}
{block name="content"}
<div class="layui-fluid">
    <div class="layui-row layui-col-space15"  id="app">
        <!--搜索条件-->
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">分销列表</div>
                <div class="layui-card-body">
                    <div class="layui-carousel layadmin-carousel layadmin-shortcut" lay-anim="" lay-indicator="inside" lay-arrow="none" style="background:none">
                        <div class="layui-card-body">
                            <div class="layui-row layui-col-space10 layui-form-item">
                                <div class="layui-col-lg12">
                                    <label class="layui-form-label">时间选择:</label>
                                    <div class="layui-input-block" data-type="data" v-cloak="">
                                        <button class="layui-btn layui-btn-normal layui-btn-sm" type="button" v-for="item in dataList" @click="setData(item)" :class="{'layui-btn-primary':where.data!=item.value}">{{item.name}}</button>
                                        <button class="layui-btn layui-btn-normal layui-btn-sm" type="button" ref="time" @click="setData({value:'zd',is_zd:true})" :class="{'layui-btn-primary':where.data!='zd'}">自定义</button>
                                        <button type="button" class="layui-btn layui-btn-sm layui-btn-primary" v-show="showtime==true" ref="date_time">{$year.0} - {$year.1}</button>
                                    </div>
                                </div>
                                <div class="layui-col-lg12">
                                    <label class="layui-form-label">用户昵称:</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="nickname" style="width: 50%" v-model="where.nickname" placeholder="请输入姓名、电话、UID" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-col-lg12">
                                    <div class="layui-input-block">
                                        <button type="button" class="layui-btn layui-btn-sm layui-btn-normal" @click="search">
                                            <i class="layui-icon">&#xe615;</i>搜索
                                        </button>
                                        <button class="layui-btn layui-btn-primary layui-btn-sm export" @click="excel">
                                            <i class="layui-icon">&#xe67d;</i>导出
                                        </button>
                                        <button class="layui-btn layui-btn-primary layui-btn-sm export" @click="refresh">
                                            <i class="layui-icon">&#xe669;</i>刷新
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--end-->
        <!-- 中间详细信息-->
        <div :class="item.col!=undefined ? 'layui-col-sm'+item.col+' '+'layui-col-md'+item.col:'layui-col-sm6 layui-col-md3'" v-for="item in badge" v-cloak="" v-if="item.count > 0">
            <div class="layui-card">
                <div class="layui-card-header">
                    {{item.name}}
                    <span class="layui-badge layuiadmin-badge" :class="item.background_color">{{item.field}}</span>
                </div>
                <div class="layui-card-body">
                    <p class="layuiadmin-big-font">{{item.count}}</p>
                    <p v-show="item.content!=undefined">
                        {{item.content}}
                        <span class="layuiadmin-span-color">{{item.sum}}<i :class="item.class"></i></span>
                    </p>
                </div>
            </div>
        </div>
        <!--enb-->
    </div>
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body">
                    <table class="layui-hide" id="userList" lay-filter="userList"></table>
                    <script type="text/html" id="headimgurl">
                        <img style="cursor: pointer" lay-event='open_image' src="{{d.headimgurl}}" height="50">
                    </script>
                    <script type="text/html" id="act">
                        <button type="button" class="layui-btn layui-btn-normal layui-btn-xs" onclick="dropdown(this)">
                            <i class="layui-icon">&#xe625;</i>操作
                        </button>
                        <ul class="layui-nav-child layui-anim layui-anim-upbit">
                            <li>
                                <a href="javascript:void(0);" class="" onclick="$eb.createModalFrame(this.innerText,'{:Url('stair')}?uid={{d.uid}}',{w:1200,h:800})">
                                    <i class="fa fa-list-alt"></i> 统计推广人列表
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" class="" onclick="$eb.createModalFrame(this.innerText,'{:Url('stair_order')}?uid={{d.uid}}',{w:1200,h:800})">
                                    <i class="fa fa-reorder"></i> 统计推广订单
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" lay-event='look_code'>
                                    <i class="fa fa-file-image-o"></i> 推广方式</a>
                            </li>
                            {{# if(d.is_show){ }}
                            <li>
                                <a href="javascript:void(0);" lay-event='delete_spread'>
                                    <i class="fa fa-unlock"></i> 清除上级推广人关系
                                </a>
                                </a>
                            </li>
                            {{# } }}
                        </ul>
                    </script>
                </div>
                <!--用户信息-->
                <script type="text/html" id="userinfo">
                    昵称：{{d.nickname==null ? '暂无信息':d.nickname}}
                    <br>姓名：{{d.real_name==null ? '暂无信息':d.real_name}}
                    <br>电话：{{d.phone==null ? '暂无信息':d.phone}}
                </script>
                <div class="option">
                    <div class="layui-box">
                        <input type="hidden" name="uid" id="uid">
                        <p data-action="wechant_code" data-type="wx">公众号推广二维码</p>
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
    var action={
        refresh:function () {
            layList.reload();
        },
        delete_spread:function () {
            var ids=layList.getCheckData().getIds('uid');
            if(ids.length){
                $eb.$swal('delete',function(){
                    $eb.axios.post(layList.U({a:'delete_promoter'}),{uids:ids}).then(function(res){
                        if(res.status == 200 && res.data.code == 200) {
                            $eb.$swal('success',res.data.msg);
                            layList.reload();
                        }else
                            return Promise.reject(res.data.msg || '清除失败')
                    }).catch(function(err){
                        $eb.$swal('error',err);
                    });
                },{
                    title:'您将解除选中用户的推广权限，请谨慎操作！',
                    text:'解除后可在会员管理里单个开启推广权限',
                    confirm:'是的我要解除'
                })
            }else{
                layList.msg('请选择要解除权限的用户');
            }
        },
    };
    layList.form.render();
    layList.tableList('userList',"{:Url('spread_list')}",function () {
        return [
            {type:'checkbox'},
            {field: 'uid', title: 'UID', align: 'center'},
            {field: 'headimgurl', title: '头像',templet:'#headimgurl',align: 'center'},
            {field: 'nickname', title: '用户信息',templet:'#userinfo'},
            {field: 'spread_count', title: '推广用户数量',sort:true,align: 'center'},
            {field: 'order_price', title: '推广订单金额',sort:true,align: 'center'},
            {field: 'order_count', title: '订单数量',align: 'center'},
            {field: 'brokerage_money', title: '佣金金额',sort:true,align: 'center'},
            {field: 'new_money', title: '未提现金额',sort:true,align: 'center'},
            {field: 'extract_count_price', title: '已提现金额',sort:true,align: 'center'},
            {field: 'extract_count_num', title: '提现次数',align: 'center'},
            {field: 'spread_name', title: '上级推广人',sort:true,align: 'center'},
            {field: 'right', title: '操作',toolbar:'#act',align: 'center'},
        ];
    });
    $('.option .layui-box').find('p').each(function () {
        $(this).on('click',function () {
            var type = $(this).data('action'),uid = $('#uid').val();
            layList.baseGet(layList.U({a:'look_code',q:{action:type,uid:uid}}),function (res) {
                if($eb){
                    $eb.openImage(res.data.code_src);
                }else{
                    layList.layer.open({
                        type: 1,
                        title: false,
                        closeBtn: 0,
                        shadeClose: true,
                        content: '<img src="'+res.data.code_src+'" style="display: block;width: 100%;" />'
                    });
                }
            },function (res) {
                layList.msg(res.msg);
            });
        });
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
                'left':-64,
                'position': 'absolute'
            }).toggle();
        }else{
            $(that).next('ul').css({
                'padding': 10,
                'left':-64,
                'top':$(that).parent('td').height() / 2 + $(that).height(),
                'min-width': 'inherit',
                'position': 'absolute'
            }).toggle();
        }
    }
    layList.tool(function (event,data,obj) {
        switch (event) {
            case 'delete_spread':
                var url=layList.U({a:'empty_spread',q:{uid:data.uid}});
                $eb.$swal('delete',function(){
                    $eb.axios.get(url).then(function(res){
                        if(res.status == 200 && res.data.code == 200) {
                            $eb.$swal('success',res.data.msg)
                        }else
                            return Promise.reject(res.data.msg || '清除失败')
                    }).catch(function(err){
                        $eb.$swal('error',err);
                    });
                },{
                    title:'您将解除【'+data.nickname+'】的上级推广人，请谨慎操作！',
                    text:'解除后无法恢复',
                    confirm:'是的我要解除'
                })
                break;
            case 'look_code':
                $('#uid').val(data.uid);
                var index=layList.layer.open({
                    type: 1,
                    area: ['200px', 'auto'], //宽高
                    content:$('.option'),
                    title:false,
                    cancel:function () {
                        $('.option').hide();
                        $('#uid').val('');
                    }
                });
                break;
            case 'open_image':
                if($eb)
                    $eb.openImage(data.headimgurl);
                else
                    layList.layer.open({
                        type: 1,
                        title: false,
                        closeBtn: 0,
                        shadeClose: true,
                        content: '<img src="'+data.headimgurl+'" style="display: block;width: 100%;" />'
                    });
                break;
        }
    });
    require(['vue'],function(Vue) {
        new Vue({
            el: "#app",
            data: {
                badge: [],
                dataList: [
                    {name: '全部', value: ''},
                    {name: '昨天', value: 'yesterday'},
                    {name: '今天', value: 'today'},
                    {name: '本周', value: 'week'},
                    {name: '本月', value: 'month'},
                    {name: '本季度', value: 'quarter'},
                    {name: '本年', value: 'year'},
                ],
                where:{
                    data:'',
                    nickname: '',
                    excel:0,
                },
                showtime: false,
            },
            watch:{

            },
            methods:{
                getBadge:function(){
                    var that=this;
                    layList.basePost(layList.Url({a:'get_badge_list'}),this.where,function (rem) {
                        that.badge=rem.data;
                    });
                },
                setData:function(item){
                    var that=this;
                    if(item.is_zd==true){
                        that.showtime=true;
                        this.where.data=this.$refs.date_time.innerText;
                    }else{
                        this.showtime=false;
                        this.where.data=item.value;
                    }
                },
                search:function () {
                    this.where.excel=0;
                    this.getBadge();
                    layList.reload(this.where,true);
                },
                excel:function () {
                    this.where.excel=1;
                    location.href=layList.U({a:'spread_list',q:this.where});
                },
                refresh:function () {
                    window.location.reload();
                }
            },
            mounted:function () {
                this.getBadge();
                layList.laydate.render({
                    elem:this.$refs.date_time,
                    trigger:'click',
                    eventElem:this.$refs.time,
                    range:true,
                    change:function (value){
                        that.where.data=value;
                    }
                });
            }
        })
    });
</script>
{/block}
