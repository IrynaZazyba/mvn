<#import "parts/common.ftl" as c>

<@c.page>
Add Tests

<form action="/addTests" method="post">
    <div>
        <label> Test type :
            <input type="text" name="type"/> </label>
    </div>
    <div>
        <label> Tests title :
            <input type="text" name="title"/> </label> ${message?ifExists}
        </label>
    </div>
    </label></div>


    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <div><input type="submit" value="Add"/></div>
</form>

</@c.page>