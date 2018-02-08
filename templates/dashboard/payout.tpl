{extends file='dashboard/base.tpl'}
{block name="page_name"}Payout Settings{/block}
{assign "page" "payout"}
{block name='dash_content'}

    <div class="row">
        <div class="col-md-offset-2 col-md-8 col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Payout Settings
                </div>
                <div class="panel-body">
                    {if isset($warning)}
                        <div id="login-alert" class="alert alert-danger col-sm-12">{$warning}</div>
                    {/if}
                    <form method="post" action="/dashboard/payout">
                        <div class="form-group">
                            <label for="payout_currency" class="form-control">Payout Currency</label>
                            <input type="hidden" id="payout_currency" name="payout_currency" value="BTC">
                            <div class="btn-group btn-group-justified">
                                <div id="currency_select">
                                    <button id="btc" class="btn btn-default active" type="button" value="BTC">
                                    <button id="eth" class="btn btn-default" type="button" value="ETH">
                                    <button id="ltc" class="btn btn-default" type="button" value="LTC">
                                    <button id="bch" class="btn btn-default" type="button" value="BCH">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="total" class="form-control">Payout Total</label>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div><!--/.row-->
{/block}
{block name='extra-scripts'}
    <script>
        var accountTotals = {$totals};
        var currencies = $("#currency_select").find(":input");
        currencies.click(function () {
            currencies.removeClass("active");
            $(this).addClass("active");
            $("#payout_currency").val(this.value.toUpperCase());
        });
        function update_total() {
            $.ajax("/api/metrics/total_value")
        }
    </script>
{/block}
