<#import "parts/common.ftl" as c>

<@c.page>
<div class="container-fluid" style="border: 1px solid black">
    <div class="row">
        <div class="col-2" style="border: 1px solid black">
            <div class="list-group">
                <a href="#" class="list-group-item list-group-item-action active">
                    Menu
                </a>

                 <#list testsType as t>

                    <a href="/testsRun?typeId=${t.id}" class="list-group-item list-group-item-action">
                    ${t.type!n/a}
                    </a>

                </#list>
            </div>
        </div>
        <div class="col-10">
            Test in development.
        </div>
    </div>
</div>

</@c.page>