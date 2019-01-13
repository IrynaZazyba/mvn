<#import "parts/commonD.ftl" as c>

<@c.page>
<div class="color-for-bar bgstart"></div>
<section class="container" xmlns="http://www.w3.org/1999/html">

    <div class="cont">

        <div class="dmat">
            <div id="print-content">
                <h3 class="tc mt10">Ваш результат по тесту</h3>
                <h4 class="tc">"${title}"</h4>
                <div class="row">
                    <div class="col-md-4 centerHirizont">
                        <div id="test-circle"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12 mc mb">
                    <button class="btn btn butSuccess mt10 mr15" type="submit">
                        <a onClick="printDiv()" title="Распечатать проект">Распечатать</a>
                    </button>
                    <button class="btn btn butSuccess mt10 mr15" type="submit"><a href="/">На главную</a>
                    </button>
                </div>
            </div>
        </div>
    </div>
</section>


</@c.page>