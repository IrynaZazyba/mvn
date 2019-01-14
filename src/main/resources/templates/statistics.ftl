<#import "parts/common.ftl" as c>
<#import "parts/navBar.ftl" as n>
<#import "parts/login.ftl" as l>
<@c.page>

    <@n.navBar />
<div id="print-content">

    <h3 class="mmain20 mcol mleft">Статистика пользователя <span class="textitalic">${user.username}</span></h3>
    <div class="col-11 mauto align-self-start ml mmain20" xmlns="http://www.w3.org/1999/html">
        <table class="table">
            <thead class="thead-inverse">
            <tr>
                <th class="tabletop">Дата начала</th>
            <#--<th>Date Finish</th>-->
                <th class="tabletop">Затраченное время
                    </br>(минуты)
                </th>
                <th class="tabletop">Название</th>
                <th class="tabletop">Результат</th>
            </tr>
            </thead>
            <#list statistics as s>
                <tbody>
                <tr>
                    <td>${s.startTimeFirst!"n/a"}</td>
                <#--<td>${s.endTime!"Running"}</td>-->
                    <#if s.getDateDiff()==-1>
                        <td>Тест не завершен</td>
                    <#else>
                        <td>${s.getDateDiff()}</td>
                    </#if>
                    <td>${s.testStTst.title!"n/a"}</td>
                <#if s.getDateDiff()==-1>
                <td> -- </td>
                <#else>
                    <td>${(s.rightAnswer/s.amountAnswers)*100!"n/a"}%</td>
                </#if>
                </tr>
                </tbody>
            </#list>
        </table>
    </div>
    </div>   
    <button class="btn btn butSuccess mt10 mr15 mleft" type="submit">
        <a onClick="printDiv()" title="Распечатать статистику">Распечатать</a></button>
</div>

</@c.page>