{extend name="public/container"}
{block name="head_top"}
<link href="{__ADMIN_PATH}module/wechat/news_category/css/style.css" type="text/css" rel="stylesheet">
{/block}
{block name="content"}
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body">
                    <div class="layui-row layui-col-space15">
                        <div class="layui-col-md12">
                            <form action="" class="form-inline">
                                <i class="fa fa-search" style="margin-right: 10px;"></i>
                                <div class="input-group">
                                    <input type="text" name="cate_name" value="{$where.cate_name}" placeholder="请输入关键词" class="input-sm form-control"> <span class="input-group-btn">
                                        <button type="submit" class="layui-btn layui-btn-normal layui-btn-sm"><i class="layui-icon">&#xe615;</i>搜索</button> </span>
                                </div>
                            </form>
                        </div>
                        <div class="layui-col-md12">
                            <div class="layui-btn-group">
                                <button type="button" class="layui-btn layui-btn-normal layui-btn-sm" onclick="action.open_add('{:Url('append')}','添加图文消息')"><i class="layui-icon">&#xe608;</i>添加素材图文消息</button>
                                <button type="button" class="layui-btn layui-btn-normal layui-btn-sm" onclick="location.reload()"><i class="layui-icon">&#xe669;</i> 刷新</button>
                            </div>
                        </div>
                        <div class="layui-col-md12">
                            <div id="news_box">
                            {volist name="list" id="vo"}
                                <div class="news_item col-sm-2" >
                                    <div class="title" style="background:none;" ><span>图文名称：{$vo.cate_name}</span></div>
                                {volist name="$vo['new']" id="vvo" key="k"}
                                    {if condition="$k eq 1"}
                                    <div class="news_tools hide">
                                        <a class="layui-btn layui-btn-normal layui-btn-sm" onclick="action.open_add('{:Url('modify',array('id'=>$vo['id']))}','编辑')"  href="javascript:void(0)"><i class="layui-icon">&#xe642;</i>编辑</a>
                                        <a class="layui-btn layui-btn-normal layui-btn-sm del_news_one" href="javascript:void(0)" data-url="{:Url('delete',array('id'=>$vo['id']))}"><i class="layui-icon">&#xe640;</i>删除</a>
                                    </div>
                                    <div class="news_articel_item" style="background-image:url({$vvo.image_input})">
                                        <p>{$vvo.title}</p>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    {else/}
                                    <div class="news_articel_item other">
                                        <div class="right-text">{$vvo.title}</div>
                                        <div class="left-image" style="background-image:url({$vvo.image_input});">
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    {/if}
                                {/volist}
                                </div>
                            {/volist}
                            </div>
                        </div>
                    </div>
                    <div style="margin-left: 10px">
                        {include file="public/inner_page"}
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
    //自定义方法
    var action= {
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
    $('body').on('mouseenter', '.news_item', function () {
        $(this).find('.news_tools').removeClass('hide');
    }).on('mouseleave', '.news_item', function () {
        $(this).find('.news_tools').addClass('hide');
    });
    $('.del_news_one').on('click',function(){
        window.t = $(this);
        var _this = $(this),url =_this.data('url');
        $eb.$swal('delete',function(){
            $eb.axios.get(url).then(function(res){
                console.log(res);
                if(res.status == 200 && res.data.code == 200) {
                    $eb.$swal('success',res.data.msg);
                    _this.parents('.news_item').remove();
                }else
                    return Promise.reject(res.data.msg || '删除失败')
            }).catch(function(err){
                $eb.$swal('error',err);
            });
        })
    });
    $('.push').on('click',function(){
        window.t = $(this);
        var _this = $(this),url =_this.data('url');
        $eb.$swal('delete',function(){
            $eb.axios.get(url).then(function(res){
                if(res.status == 200 && res.data.code == 200) {
                    $eb.$swal('success',res.data.msg);
                }else
                    return Promise.reject(res.data.msg || '删除失败')
            }).catch(function(err){
                $eb.$swal('error',err);
            });
        })
    });
</script>
{/block}
