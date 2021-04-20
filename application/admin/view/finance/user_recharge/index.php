{extend name="public/container"}
{block name="content"}
<div class="layui-fluid">
<div class="layui-row">
    <div class="layui-col-md12">
        <div class="layui-card">
            <div class="layui-card-body">
                <div class="layui-row layui-col-space10">
                    <div class="layui-col-md12">
                        <form action="" class="layui-form layui-form-pane">
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <div class="layui-input-inline">
                                        <input size="26" type="text" name="order_id" value="{$where.order_id}" placeholder="请输入订单编号、编号" class="input-sm form-control">
                                    </div>
                                </div>
                                <div class="layui-inline">
                                    <div class="layui-input-inline">
                                         <div class="layui-btn-group">
                                            <button type="submit" class="layui-btn layui-btn-normal layui-btn-sm"><i class="layui-icon">&#xe615;</i>搜索</button>
                                            <button class="layui-btn layui-btn-normal layui-btn-sm" onclick="window.location.reload()" style="margin-left: 5px;"><i class="layui-icon">&#xe669;</i>刷新</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="layui-col-md12">
                        <table class="layui-table">
                            <thead>
                            <tr>
                                <th style="width:60px;text-align: center;">编号</th>
                                <th style="text-align: center;">姓名</th>
                                <th style="text-align: center;">订单编号</th>
                                <th style="text-align: center;">支付金额</th>
                                <th style="text-align: center;">支付类型</th>
                                <th style="text-align: center;">支付时间</th>
                                <!--<th class="text-center">操作</th>-->
                            </tr>
                            </thead>
                            <tbody>
                            {volist name="list" id="vo"}
                            <tr>
                                <td class="text-center">{$vo.id}</td>
                                <td class="text-center">{$vo.nickname}</td>
                                <td class="text-center">{$vo.order_id}</td>
                                <td class="text-center">
                                    {$vo.price}
                                    {if condition="$vo['refund_price'] GT 0"}
                                    <p>退款金额：{$vo.refund_price}</p>
                                    {/if}
                                </td>
                                <td class="text-center">{$recharge_type_cn[$vo.recharge_type]}</td>
                                <td class="text-center">{$vo.pay_time|date='Y-m-d H:i:s',###}</td>
                               <!-- <td class="text-center">
                                    <button class="btn btn-info btn-xs" type="button"  onclick="$eb.createModalFrame('退款','{:Url('edit',array('id'=>$vo['id']))}',{h:'300',w:'500'})"><i class="fa fa-paste"></i> 退款</button>
                                </td>-->
                            </tr>
                            {/volist}
                            </tbody>
                        </table>
                    </div>
                </div>
                {include file="public/inner_page"}
            </div>
        </div>
    </div>
</div>
</div>
{/block}
{block name="script"}
<script>
    $(".open_image").on('click',function (e) {
        var image = $(this).data('image');
        $eb.openImage(image);
    })
</script>
{/block}
