<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>
<div>Hello
    ${message}
</div>
<a href="/">Main page</a>
<@l.logout />
<span><a href="/user">User List</a></span>
<apan><a href="/addTests">Add tests</a></apan>
</@c.page>