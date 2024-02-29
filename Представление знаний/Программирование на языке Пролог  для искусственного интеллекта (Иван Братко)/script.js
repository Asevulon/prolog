////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////

/*  Скрипты для книги

    "Иван Братко.  
 
    Программирование на языке Пролог для искусственного интеллекта"

    http://dstu2204.narod.ru/3sem/lp/index.htm
*/

////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////

//  Этот скрипт открывает окно. 
//  Без этого скрипта можно было бы обойтись, он просто для удобства сделан.

function fk(page,num) // fk - "find keyword".
{
window.open('ch'+page+'.htm#tn'+num);
}


/*  Этот скрипт подсвечивает ключевое слово в тексте, когда мы переходим 
   на данную страницу, кликая на соответствующий термин 
   в алфавитном указателе. 
   Подсветка исчезает при обновлении страницы (кнопка "Обновить" или F5). */

function hl() // hl - "highlight".
{

if (location.hash!='' && location.hash.substring(1,2)!='p'
    && navigator.ivanov_viktor!=1) 
{
id=eval('t'+location.hash.substring(3,6)); // превращаем строку в объект. 
		// Цифра "6" используется вместо цифры "4" с учётом 
		// трёхзначных номеров в конце алфавитного указателя.

id.style.color="white";
id.style.background="navy";
navigator.ivanov_viktor=1; // присваиваем своё свойство объекту navigator
}
}


//  Этот скрипт открывает окно. 
//  Без этого скрипта можно было бы обойтись, он просто для удобства сделан.

function fa(num) // fa - "find answer".
{
window.open('some_answers.htm#ap'+num);
}


/*  Этот скрипт подсвечивает нужный ответ на странице с ответами,
   когда мы переходим на неё, кликая на ссылку "посмотреть ответ" в
   соответствующем месте какой-либо страницы. 
   Подсветка исчезает при обновлении страницы (кнопка "Обновить" или F5). */


function ha() //ha - "highlight answer".
{
if (location.hash!=''&&navigator.ivanov_viktor!=1) 
{
var num=location.hash.substring(3,7);

var ad=eval('ad'+num); // превращаем строку в объект.
var ah=eval('ah'+num); // превращаем строку в объект.

ad.style.background="#FFB588";
ah.style.color="white";
ah.style.background="navy";
navigator.ivanov_viktor=1; // присваиваем своё свойство объекту navigator
}
}

///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
 
function double_line()
{
/* Эта функция рисует двойную горизонтальную объёмную линию серого цвета -
   это аналог тега "<hr>", т.е. функция рисует как бы "двойной <hr>",
   причём теми же цветами. */

var width=window.screen.width-40; /* получаем ширину линии в зависимости
                                     от текущего разрешения экрана.
  Кстати, при переключении разрешения не забудьте обновить окно. */

// рисуем 4 линии 2 цветами так, что они сольются в 2 линии

document.writeln('<html xmlns:v=\"urn:schemas-microsoft-com:vml\">');
document.writeln('<style>v\\:* {behavior:url(#default#VML); position:absolute;}</style>');
document.write('<v:line from=\"0,3\" to=\"');
document.write(width);
document.writeln(',3\" strokecolor=\"#808080\">');
document.writeln('</v:line> <v:line from=\"0,4\" to=\"');
document.write(width);
document.writeln(',4\" strokecolor=\"#c0c0c0\"> </v:line>');
document.writeln('<v:line from=\"0,11\" to=\"');
document.write(width);
document.writeln(',11\" strokecolor=\"#808080\">');
document.writeln('</v:line> <v:line from=\"0,12\" to=\"');
document.write(width);
document.writeln(',12\" strokecolor=\"#c0c0c0\"> </v:line>');
document.writeln('<br><br></html>');
}


function line()
{
// Эта функция рисует тонкую, в отличие от тега "<hr>", горизонтальную линию
// серого цвета. Функция аналогична предыдущей.

var width=window.screen.width-40;  /* получаем ширину линии в зависимости
                                      от текущего разрешения экрана.
  Кстати, при переключении разрешения монитора не забудьте обновить окно. */

document.writeln('<html xmlns:v=\"urn:schemas-microsoft-com:vml\">');
document.writeln('<style>v\\:* {behavior:url(#default#VML); position:absolute;}</style>');
document.writeln('<v:line from=\"0,3\" to=\"');
document.write(width);
document.writeln(',3\" strokecolor=\"#808080\"> </v:line>');
document.writeln('<br></html>');
}


////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////

function wca(p) // вспомогательная функция "write with comma added" 
                // для - drc(p1, p2, color) добавить запятую и так 
                // записать в документ
{
document.write(p);
document.write(',');
}


function drc(p1, p2, color) /* Вспомогательная функция 
                              "draw rectangle with color" 
                              для double_rectangle(); рисует прямогольник
                              с задаваемыми смещениями и цветом */
{
var width=window.screen.width-40;  /* получаем ширину фигуры в зависимости
                                      от текущего разрешения экрана.*/
  
var height=window.screen.height+140;  /* получаем высоту фигуры в зависимости
                                      от текущего разрешения экрана.
  Кстати, при переключении разрешения монитора не забудьте обновить окно. */

// рисуем замкнутую в прямоугольник полилинию (5 точек)

document.writeln('<v:polyline points=\"');
wca(p1);
wca(p2);
wca(width-p1);
wca(p2);
wca(width-p1);
wca(height-p2);
wca(p1);
wca(height-p2);
wca(p1);
document.writeln(p2);
document.writeln('\" filled=\"f\"');
document.write('strokecolor=\"#')
document.write(color);
document.writeln('\"> </v:polyline>');
}


function double_rectangle() // функция рисует прямоугольник 
                            // двойной объёмной линией серого цвета 
{
document.writeln('<html xmlns:v=\"urn:schemas-microsoft-com:vml\">');
document.writeln('<style>v\\:* {behavior:url(#default#VML); position:absolute;}</style>');

// рисуем 4 прямоугольника 2 цветами так, что они сольются в 2 прямоугольника

drc(40,10,'808080');
drc(41,11,'c0c0c0');
drc(48,18,'808080');
drc(49,19,'c0c0c0');

document.writeln('<br></html>');
}