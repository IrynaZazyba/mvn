<#import "parts/common.ftl" as c>
<#import "parts/navBar.ftl" as n>
<#import "parts/login.ftl" as l>
<@c.page>

    <@n.navBar />

    <h3>List of statistics</h3>
    <div class="col-11 mauto align-self-start" xmlns="http://www.w3.org/1999/html">
        <table class="table">
            <thead class="thead-inverse">
            <tr>
                <th>Date Start</th>
                <th>Date Finish</th>
                <th>Title</th>
                <th>Results </th>
            </tr>
            </thead>
            <#list statistics as s>
                <tbody>
                <tr>
                    <td>${s.startTime!"n/a"}</td>
                    <td>${s.endTime!"Running"}</td>
                    <td>${s.testStTst.title!"n/a"}</td>
                    <td>${(s.rightAnswer/s.amountAnswers)*100!"n/a"}%</td>
                </tr>
                </tbody>
            </#list>
        </table>
    </div>
</@c.page>