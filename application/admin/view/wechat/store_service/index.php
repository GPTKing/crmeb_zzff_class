{extend name="public/container"}
{block name="head_top"}{/block}
{block name="content"}
<div class="layui-fluid">
    <div class="layui-card">
        <div class="layui-card-header">
            <div style="font-weight: bold;">客服管理</div>
        </div>
        <div class="layui-card-body">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-btn-group">
                        <button type="button" class="layui-btn layui-btn-normal layui-btn-sm" onclick="$eb.createModalFrame('添加客服','{:Url('create')}')"><i class="layui-icon">&#xe608;</i>添加客服</button>
                    </div>
                    <table class="layui-table">
                        <thead>
                        <tr>
                            <th class="text-center" style="width: 60px;text-align: center;">编号</th>
                            <th style="text-align: center;">微信用户名称</th>
                            <th style="text-align: center;">客服头像</th>
                            <th style="text-align: center;">客服名称</th>
                            <th style="text-align: center;">是否显示</th>
                            <th style="text-align: center;">添加时间</th>
                            <th style="text-align: center;">操作</th>
                        </tr>
                        </thead>
                        <tbody class="">
                        {volist name="list" id="vo"}
                        <tr>
                            <td class="text-center">{$vo.id}</td>
                            <td class="text-center">{$vo.wx_name}</td>
                            <td class="text-center"><img src="{$vo.avatar}" class="head_image" data-image="{$vo.avatar}" height="50"></td>
                            <td class="text-center">{$vo.nickname}</td>
                            <td class="text-center">
                                <i class="fa {eq name='vo.status' value='1'}fa-check text-navy{else/}fa-close text-danger{/eq}"></i>
                            </td>
                            <td class="text-center">{$vo.add_time|date='Y-m-d H:i:s',###}</td>
                            <td class="text-center">
                                <button class="layui-btn layui-btn-normal layui-btn-xs" type="button"  onclick="$eb.createModalFrame('聊天记录','{:Url('chat_user',array('id'=>$vo['id']))}')"><i class="layui-icon">&#xe60a;</i>聊天记录</button>
                                <button class="layui-btn layui-btn-normal layui-btn-xs" type="button"  onclick="$eb.createModalFrame('编辑','{:Url('edit',array('id'=>$vo['id']))}')"><i class="layui-icon">&#xe642;</i>编辑</button>
                                <button class="layui-btn layui-btn-danger layui-btn-xs" data-url="{:Url('delete',array('id'=>$vo['id']))}" type="button"><i class="layui-icon">&#xe640;</i>删除</button>
                            </td>
                        </tr>
                        {/volist}
                        </tbody>
                    </table>
                </div>
                {include file="public/inner_page"}
            </div>
        </div>
    </div>
    {/block}
    {block name="script"}
    <script>
        $('.layui-btn-danger').on('click',function(){
            window.t = $(this);
            var _this = $(this),url =_this.data('url');
            $eb.$swal('delete',function(){
                $eb.axios.get(url).then(function(res){
                    if(res.status == 200 && res.data.code == 200) {
                        $eb.$swal('success',res.data.msg);
                        _this.parents('tr').remove();
                    }else
                        return Promise.reject(res.data.msg || '删除失败')
                }).catch(function(err){
                    $eb.$swal('error',err);
                });
            })
        });
        $('.head_image').on('click',function (e) {
            var image = $(this).data('image');
            $eb.openImage(image);
        })
    </script>
</div>
{/block}
