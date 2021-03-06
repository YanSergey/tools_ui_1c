////////////////////////////////////////////////////////////////////////////////
// СЛУЖЕБНЫЕ ПРОЦЕДУРЫ И ФУНКЦИИ

// Процедура устанавливает текст надписи текста выражения
//
&НаКлиенте
Процедура УстановитьНадписьТекстВыражения()
	Если РежимЗагрузки = 1 Тогда
		
		Если Элементы.ГруппаПанель.ТекущаяСтраница.Имя = "ГруппаПослеДобавленияСтроки" Тогда
			
			НадписьТекстВыражения =
			"В тексте выражения можно использовать следующие предопределенные параметры:
			|   Объект         - Записываемый объект
			|   ТекущиеДанные  - Содержит данные загружаемой строки табличной части.
			|   ТекстыЯчеек    - массив текстов ячеек строки
			|Встроенные функции, функции общих модулей.";
		Иначе
			
			НадписьТекстВыражения =
			"В тексте выражения можно использовать следующие предопределенные параметры:
			|   Объект         - Записываемый объект
			|   Отказ          - Признак отказа от записи объекта
			|Встроенные функции, функции общих модулей.";
			
		КонецЕсли;
		
	ИначеЕсли РежимЗагрузки =0 Тогда
		
		НадписьТекстВыражения =
		"В тексте выражения можно использовать следующие предопределенные параметры:
		|   Объект         - Записываемый объект
		|   Отказ          - Признак отказа от записи объекта
		|   ТекстыЯчеек    - массив текстов ячеек строки
		|Встроенные функции, функции общих модулей.";
		
	ИначеЕсли РежимЗагрузки =2 Тогда
		НадписьТекстВыражения =
		"В тексте выражения можно использовать следующие предопределенные параметры:
		|   Объект         - Менеджер записи регистра сведений
		|   Отказ          - Признак отказа от записи объекта
		|   ТекстыЯчеек    - массив текстов ячеек строки
		|Встроенные функции, функции общих модулей.";
	КонецЕсли;
	
КонецПроцедуры // ()

////////////////////////////////////////////////////////////////////////////////
// ОБРАБОТЧИКИ СОБЫТИЙ ФОРМЫ

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
	Если РежимЗагрузки = 2 Тогда
		Элементы.ГруппаПанель.Страницы.ГруппаПередЗаписьюОбъекта.Заголовок = "Перед записью";
		Элементы.ГруппаПанель.Страницы.ГруппаПриЗаписиОбъекта.Заголовок =    "При записи";
	КонецЕсли;
	
	Элементы.ГруппаПослеДобавленияСтроки.Видимость = РежимЗагрузки = 1;
	УстановитьНадписьТекстВыражения();
	
КонецПроцедуры

////////////////////////////////////////////////////////////////////////////////
// ОБРАБОТЧИКИ СОБЫТИЙ ЭЛЕМЕНТОВ УПРАВЛЕНИЯ

// Процедура - обаботчик события, при нажатии на кнопку "ОК" Командной панели "ОсновныеДействияФормы"
//
&НаКлиенте
Процедура ОсновныеДействияФормыОК(Команда)
	ОповеститьОВыборе(Новый Структура("Источник, Результат, ПередЗаписьюОбъекта, ПриЗаписиОбъекта, ПослеДобавленияСтроки", 
	"ФормаРедактированияСобытий", Истина, ПередЗаписьюОбъекта.ПолучитьТекст(), ПриЗаписиОбъекта.ПолучитьТекст(), ПослеДобавленияСтроки.ПолучитьТекст()));
КонецПроцедуры

// Процедура - обаботчик события "ПриСменеСтраницы" в: Панель "Панель"
//
&НаКлиенте
Процедура ПанельПриСменеСтраницы(Элемент, ТекущаяСтраница)
	УстановитьНадписьТекстВыражения();
КонецПроцедуры

