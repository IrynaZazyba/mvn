<#import "parts/common.ftl" as c>
<#import "parts/navBar.ftl" as n>
<#import "parts/adminMenuTest.ftl" as at>
<#import "parts/login.ftl" as l>
<@c.page>
    <@n.navBar/>
    <@at.adminMenuTest>
    <div>
        <form action="/addTestsType" method="post" xmlns="http://www.w3.org/1999/html">
            <div class="form-group col-3">
                <label> Test type :</label>
                <input class="form-control" type="text" name="type"/>
                <#if result??>
                    <#if result="true">
                        <span class="greenColor">Type of tests is added</span>
                    <#else> <span class="redColor">Раздел существует либо значение отсутствует</span>
                    </#if>
                </#if>

            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <div>
                <button class="btn btn butSuccess mt10" type="submit">Add
                </button>
            </div>
            </div>
        </form>
    </div>
    </@at.adminMenuTest>
</@c.page>