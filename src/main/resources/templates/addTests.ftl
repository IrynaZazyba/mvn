<#import "parts/common.ftl" as c>
<#import "parts/navBar.ftl" as n>
<#import "parts/adminMenuTest.ftl" as at>
<#import "parts/login.ftl" as l>
<@c.page>
<@n.navBar/>
<@at.adminMenuTest/>

<#--<form action="/addTests" method="post">-->
    <#--<div>-->
        <#--<label> Test type :-->
            <#--<input type="text" name="type"/> </label>-->
    <#--</div>-->
    <#--<div>-->
        <#--<label> Tests title :-->
            <#--<input type="text" name="title"/> </label> ${message?ifExists}-->
        <#--</label>-->
    <#--</div>-->
    <#--</label></div>-->


    <#--<input type="hidden" name="_csrf" value="${_csrf.token}"/>-->
    <#--<div><input type="submit" value="Add"/></div>-->
<#--</form>-->

</@c.page>