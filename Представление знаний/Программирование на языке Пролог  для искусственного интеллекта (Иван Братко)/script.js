////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////

/*  ������� ��� �����

    "���� ������.  
 
    ���������������� �� ����� ������ ��� �������������� ����������"

    http://dstu2204.narod.ru/3sem/lp/index.htm
*/

////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////

//  ���� ������ ��������� ����. 
//  ��� ����� ������� ����� ���� �� ��������, �� ������ ��� �������� ������.

function fk(page,num) // fk - "find keyword".
{
window.open('ch'+page+'.htm#tn'+num);
}


/*  ���� ������ ������������ �������� ����� � ������, ����� �� ��������� 
   �� ������ ��������, ������ �� ��������������� ������ 
   � ���������� ���������. 
   ��������� �������� ��� ���������� �������� (������ "��������" ��� F5). */

function hl() // hl - "highlight".
{

if (location.hash!='' && location.hash.substring(1,2)!='p'
    && navigator.ivanov_viktor!=1) 
{
id=eval('t'+location.hash.substring(3,6)); // ���������� ������ � ������. 
		// ����� "6" ������������ ������ ����� "4" � ������ 
		// ���������� ������� � ����� ����������� ���������.

id.style.color="white";
id.style.background="navy";
navigator.ivanov_viktor=1; // ����������� ��� �������� ������� navigator
}
}


//  ���� ������ ��������� ����. 
//  ��� ����� ������� ����� ���� �� ��������, �� ������ ��� �������� ������.

function fa(num) // fa - "find answer".
{
window.open('some_answers.htm#ap'+num);
}


/*  ���� ������ ������������ ������ ����� �� �������� � ��������,
   ����� �� ��������� �� ��, ������ �� ������ "���������� �����" �
   ��������������� ����� �����-���� ��������. 
   ��������� �������� ��� ���������� �������� (������ "��������" ��� F5). */


function ha() //ha - "highlight answer".
{
if (location.hash!=''&&navigator.ivanov_viktor!=1) 
{
var num=location.hash.substring(3,7);

var ad=eval('ad'+num); // ���������� ������ � ������.
var ah=eval('ah'+num); // ���������� ������ � ������.

ad.style.background="#FFB588";
ah.style.color="white";
ah.style.background="navy";
navigator.ivanov_viktor=1; // ����������� ��� �������� ������� navigator
}
}

///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
 
function double_line()
{
/* ��� ������� ������ ������� �������������� �������� ����� ������ ����� -
   ��� ������ ���� "<hr>", �.�. ������� ������ ��� �� "������� <hr>",
   ������ ���� �� �������. */

var width=window.screen.width-40; /* �������� ������ ����� � �����������
                                     �� �������� ���������� ������.
  ������, ��� ������������ ���������� �� �������� �������� ����. */

// ������ 4 ����� 2 ������� ���, ��� ��� �������� � 2 �����

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
// ��� ������� ������ ������, � ������� �� ���� "<hr>", �������������� �����
// ������ �����. ������� ���������� ����������.

var width=window.screen.width-40;  /* �������� ������ ����� � �����������
                                      �� �������� ���������� ������.
  ������, ��� ������������ ���������� �������� �� �������� �������� ����. */

document.writeln('<html xmlns:v=\"urn:schemas-microsoft-com:vml\">');
document.writeln('<style>v\\:* {behavior:url(#default#VML); position:absolute;}</style>');
document.writeln('<v:line from=\"0,3\" to=\"');
document.write(width);
document.writeln(',3\" strokecolor=\"#808080\"> </v:line>');
document.writeln('<br></html>');
}


////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////

function wca(p) // ��������������� ������� "write with comma added" 
                // ��� - drc(p1, p2, color) �������� ������� � ��� 
                // �������� � ��������
{
document.write(p);
document.write(',');
}


function drc(p1, p2, color) /* ��������������� ������� 
                              "draw rectangle with color" 
                              ��� double_rectangle(); ������ ������������
                              � ����������� ���������� � ������ */
{
var width=window.screen.width-40;  /* �������� ������ ������ � �����������
                                      �� �������� ���������� ������.*/
  
var height=window.screen.height+140;  /* �������� ������ ������ � �����������
                                      �� �������� ���������� ������.
  ������, ��� ������������ ���������� �������� �� �������� �������� ����. */

// ������ ��������� � ������������� ��������� (5 �����)

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


function double_rectangle() // ������� ������ ������������� 
                            // ������� �������� ������ ������ ����� 
{
document.writeln('<html xmlns:v=\"urn:schemas-microsoft-com:vml\">');
document.writeln('<style>v\\:* {behavior:url(#default#VML); position:absolute;}</style>');

// ������ 4 �������������� 2 ������� ���, ��� ��� �������� � 2 ��������������

drc(40,10,'808080');
drc(41,11,'c0c0c0');
drc(48,18,'808080');
drc(49,19,'c0c0c0');

document.writeln('<br></html>');
}