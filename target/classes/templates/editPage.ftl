<#import "temp/common.ftl" as c>

<@c.page>
<style type="text/css">
    .title_margin {
        margin-left: 110px;
        margin-bottom: 30px;
    }
    .parent {
        width: 100%;
        height: 100%;
        position: absolute;
        top: 0;
        left: 0;
        overflow: auto;
    }

    .block {
        width: 590px;
        height: 650px;
        position: absolute;
        top: 15%;
        left: 40%;
        margin: -125px 0 0 -125px;
    }
</style>
<div class="parent">
    <div class="block">
        <div class="title_margin">
            <b>Редактирование позиции</b>
        </div>
        <div>
            <form method="post" action="/makeChanges/${id}">
                <div>
                    <label>Наименование<input type="text" name="name" value="${name}"></label>
                </div>
                <div>
                    <label> Необходимость <input type="checkbox" name="necessary" ${checked?matches("true")?string("checked", "")}></label>
                </div>
                <div>
                    <label> Количество <input type="number" name="quantity" value="${quantity}"></label>
                </div>
                <div><input type="submit" value="Сохранить"/></div>
            </form>
        </div>
    </div>
</div>
</@c.page>