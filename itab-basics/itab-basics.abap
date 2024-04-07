CLASS zcl_itab_basics DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .


  PUBLIC SECTION.
    TYPES group TYPE c LENGTH 1.
    TYPES: BEGIN OF initial_type,
             group       TYPE group,
             number      TYPE i,
             description TYPE string,
           END OF initial_type,
           itab_data_type TYPE STANDARD TABLE OF initial_type WITH EMPTY KEY.

    METHODS fill_itab
           RETURNING
             VALUE(initial_data) TYPE itab_data_type.

    METHODS add_to_itab
           IMPORTING initial_data TYPE itab_data_type
           RETURNING
            VALUE(updated_data) TYPE itab_data_type.

    METHODS sort_itab
           IMPORTING initial_data TYPE itab_data_type
           RETURNING
            VALUE(updated_data) TYPE itab_data_type.

    METHODS search_itab
           IMPORTING initial_data TYPE itab_data_type
           RETURNING
             VALUE(result_index) TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_itab_basics IMPLEMENTATION.
  METHOD fill_itab.
    data: ls_initial_data type initial_type,
          lt_initial_data type itab_data_type.

    clear ls_initial_data.
    ls_initial_data-group = 'A'.
    ls_initial_data-number = 10.
    ls_initial_data-description = 'Group A-2'.
    append ls_initial_data to lt_initial_data.

    clear ls_initial_data.
    ls_initial_data-group = 'B'.
    ls_initial_data-number = 5.
    ls_initial_data-description = 'Group B'.
    append ls_initial_data to lt_initial_data.

    clear ls_initial_data.
    ls_initial_data-group = 'A'.
    ls_initial_data-number = 6.
    ls_initial_data-description = 'Group A-1'.
    append ls_initial_data to lt_initial_data.

    clear ls_initial_data.
    ls_initial_data-group = 'C'.
    ls_initial_data-number = 22.
    ls_initial_data-description = 'Group C-1'.
    append ls_initial_data to lt_initial_data.

    clear ls_initial_data.
    ls_initial_data-group = 'A'.
    ls_initial_data-number = 13.
    ls_initial_data-description = 'Group A-3'.
    append ls_initial_data to lt_initial_data.

    clear ls_initial_data.
    ls_initial_data-group = 'C'.
    ls_initial_data-number = 500.
    ls_initial_data-description = 'Group C-2'.
    append ls_initial_data to lt_initial_data.

    initial_data = lt_initial_data.
  ENDMETHOD.

  METHOD add_to_itab.
    updated_data = initial_data.
    data: ls_initial_data type initial_type.

    clear ls_initial_data.
    ls_initial_data-group = 'A'.
    ls_initial_data-number = 19.
    ls_initial_data-description = 'Group A-4'.
    append ls_initial_data to updated_data.

  ENDMETHOD.

  METHOD sort_itab.
    updated_data = initial_data.
    SORT updated_data BY group ASCENDING
    number DESCENDING.  
  ENDMETHOD.

METHOD search_itab.
  DATA: temp_data TYPE itab_data_type,
        wa         TYPE initial_type.

  LOOP AT initial_data INTO wa.
    IF wa-number = 6.
      result_index = sy-tabix.
      EXIT.
    ENDIF.
  ENDLOOP.
ENDMETHOD.


ENDCLASS.