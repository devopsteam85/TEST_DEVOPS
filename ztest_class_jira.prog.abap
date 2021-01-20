*&---------------------------------------------------------------------*
*& Report ZTEST_CLASS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztest_class_jira.
CLASS lcl_devops DEFINITION.
  PUBLIC SECTION.
    METHODS
      to_arabic IMPORTING i_roman         TYPE char4
                RETURNING VALUE(r_arabic) TYPE char4.
ENDCLASS.
REPORT ztest_class_jira.
CLASS lcl_devops DEFINITION.
  PUBLIC SECTION.
    METHODS
      to_arabic IMPORTING i_roman         TYPE char4
                RETURNING VALUE(r_arabic) TYPE char4.
ENDCLASS.
cd sonar.bat

CLASS lcl_devops_unit DEFINITION FOR TESTING
  RISK LEVEL HARMLESS
        DURATION SHORT.
  PRIVATE SECTION.
    DATA r_cut TYPE REF TO lcl_devops.
    METHODS:
      setup,
      teardown,
      input_i_output_1 FOR TESTING,
      input_ii_output_2 FOR TESTING,
      input_iii_output_3 FOR TESTING.
*     input_iv_output_4 FOR TESTING,
*      input_v_output_5 FOR TESTING,
*      input_vi_output_6 FOR TESTING.

ENDCLASS.
CLASS lcl_devops IMPLEMENTATION.
  METHOD  to_arabic.
    CASE i_roman.
      WHEN 'I'.
        r_arabic = 1.
      WHEN 'II'.
        r_arabic = 2.
      WHEN 'III'.
        r_arabic = 3.
    ENDCASE.
  ENDMETHOD.
ENDCLASS.

CLASS lcl_devops_unit IMPLEMENTATION.
  METHOD setup.
*   given
    r_cut = NEW lcl_devops( ).

  ENDMETHOD.

  METHOD input_i_output_1.

*   when
    DATA(l_arabic) = r_cut->to_arabic( i_roman = 'I').
*   then
    cl_abap_unit_assert=>assert_equals( act = l_arabic
                                        exp = 1 ).
  ENDMETHOD.

  METHOD input_ii_output_2.
*  when
    DATA(l_arabic) = r_cut->to_arabic( i_roman = 'II').
*  then
    cl_abap_unit_assert=>assert_equals( act = l_arabic
                                        exp = 2 ).
  ENDMETHOD.

  METHOD input_iii_output_3.
*   when
    DATA(l_arabic) = r_cut->to_arabic( i_roman = 'III').
*   then
    cl_abap_unit_assert=>assert_equals( act = l_arabic
                                        exp = 3 ).
  ENDMETHOD.

  METHOD teardown.
    CLEAR r_cut.
  ENDMETHOD.
ENDCLASS.
