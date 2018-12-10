<#import "parts/common.ftl" as c>
<#import "parts/navBar.ftl" as n>
<#import "parts/adminMenu.ftl" as am>
<#import "parts/login.ftl" as l>
<@c.page>

    <@n.navBar />
    <@am.adminMenu>

    List of users
    <div class="col-8 align-self-start" xmlns="http://www.w3.org/1999/html">
        <table class="table">
            <thead class="thead-inverse">
            <tr>
                <th>Name</th>
                <th>Role</th>
                <th></th>
            </tr>
            </thead>
            <#list users as user>
                <tbody>
                <tr>
                    <td>${user.username!"n/a"}</td>
                    <td><#list user.roles as role>${role}<#sep>, </#list></td>
                    <td>
                        <button type="button" class="btn btn-link">
                        <a href="/user/${user.id}">edit</a></button></td>
                </tr>
                </tbody>
            </#list>
        </table>
    </div>
    </@am.adminMenu>
</@c.page>