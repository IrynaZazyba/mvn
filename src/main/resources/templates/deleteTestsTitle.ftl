<#import "parts/common.ftl" as c>
<#import "parts/navBar.ftl" as n>
<#import "parts/adminMenuTest.ftl" as at>
<#import "parts/login.ftl" as l>
<@c.page>
    <@n.navBar/>
    <@at.adminMenuTest>
<div class="alert alert-danger" role="alert">
    <h6>Удаление теста влечёт за собой удаление статистических данных!</h6>
</div>
 <h3 class="ml">Удаление типов тестов</h3>
    <div class="col-8 align-self-start mt10 mmain20" xmlns="http://www.w3.org/1999/html">
        <table class="table">
            <thead class="thead-inverse">
            <tr>
                <th class="tabletop">Заголовок</th>
                <th class="tabletop">Тип теста</th>
                <th class="tabletop"></th>
            </tr>
            </thead>
            <tbody>
              <#list tests as tt>

              <tr>
                  <td>${tt.title}</td>
                  <td>${tt.type.type}</td>
                  <td>
                      <button type="button" class="btn btn-link">
                          <a href="/deleteTestsTitle/${tt.id}">delete</a></button>
                  </td>
              </tr>

              </#list>
            </tbody>
        </table>
    </div>

    </@at.adminMenuTest>
</@c.page>