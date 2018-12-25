<#import "parts/common.ftl" as c>
<#import "parts/navBar.ftl" as n>
<#import "parts/adminMenuTest.ftl" as at>
<#import "parts/login.ftl" as l>
<@c.page>
    <@n.navBar/>
    <@at.adminMenuTest>

    <form action="/addTestsTitle" method="post">
        <div class="form-group col-4">
            <label> Type: <select class="form-control" name="type">
                <#list testsType as tt>
                    <option value="${tt.id}">${tt.type}</option>
                </#list>
            </select>
                <div>
                    <label class="mt10"> Tests title :</label>
                    <input class="form-control" type="text" name="title"/> ${message?ifExists}
            </label>
            <#if result??>
                <#if result="true">
                    <span class="greenColor">Title is added</span>
                <#else> <span class="redColor">Введите значение</span>
                </#if>
            </#if>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <div>
                <button class="btn btn butSuccess mt10" type="submit">Add
                </button>
            </div>
        </div>
    </form>
    <#--<#if result??>-->
    <#--<div>-->
    <#--${reault}-->
    <#--&lt;#&ndash;<#if result=true>&ndash;&gt;-->
    <#--&lt;#&ndash;<span>Type of tests is added</span>&ndash;&gt;-->
    <#--&lt;#&ndash;<#else> <span>Type of tests already exists</span>&ndash;&gt;-->
    <#--&lt;#&ndash;</#if>&ndash;&gt;-->

    <#--</div>-->
    <#--</#if>-->
    </@at.adminMenuTest>
</@c.page>