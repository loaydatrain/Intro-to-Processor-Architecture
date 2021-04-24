/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x8ddf5b5d */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/loay/Desktop/finalproc/finalproc.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {0U, 1U};
static unsigned int ng3[] = {1U, 0U};
static unsigned int ng4[] = {2U, 0U};
static unsigned int ng5[] = {3U, 0U};
static unsigned int ng6[] = {4U, 0U};
static unsigned int ng7[] = {5U, 0U};
static unsigned int ng8[] = {6U, 0U};
static unsigned int ng9[] = {7U, 0U};
static unsigned int ng10[] = {8U, 0U};
static unsigned int ng11[] = {9U, 0U};
static unsigned int ng12[] = {10U, 0U};
static int ng13[] = {0, 0};
static unsigned int ng14[] = {11U, 0U};
static unsigned int ng15[] = {12U, 0U};
static unsigned int ng16[] = {13U, 0U};
static unsigned int ng17[] = {14U, 0U};
static unsigned int ng18[] = {15U, 0U};



static void Always_12_0(char *t0)
{
    char t11[8];
    char t41[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    int t32;
    int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t40;
    char *t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    char *t47;

LAB0:    t1 = (t0 + 3480U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(12, ng0);
    t2 = (t0 + 3800);
    *((int *)t2) = 1;
    t3 = (t0 + 3512);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(13, ng0);

LAB5:    xsi_set_current_line(14, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 2248);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    xsi_set_current_line(15, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(17, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = (t0 + 2408);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 32);
    xsi_set_current_line(18, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = (t0 + 2568);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 32);
    xsi_set_current_line(19, ng0);
    t2 = (t0 + 1528U);
    t3 = *((char **)t2);

LAB6:    t2 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng3)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng4)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng5)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t6 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng6)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t6 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng7)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t6 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng8)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t6 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng9)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t6 == 1)
        goto LAB21;

LAB22:    t2 = ((char*)((ng10)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t6 == 1)
        goto LAB23;

LAB24:    t2 = ((char*)((ng11)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t6 == 1)
        goto LAB25;

LAB26:    t2 = ((char*)((ng12)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t6 == 1)
        goto LAB27;

LAB28:    t2 = ((char*)((ng14)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t6 == 1)
        goto LAB29;

LAB30:    t2 = ((char*)((ng15)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t6 == 1)
        goto LAB31;

LAB32:    t2 = ((char*)((ng16)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t6 == 1)
        goto LAB33;

LAB34:    t2 = ((char*)((ng17)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t6 == 1)
        goto LAB35;

LAB36:    t2 = ((char*)((ng18)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t6 == 1)
        goto LAB37;

LAB38:
LAB40:
LAB39:    xsi_set_current_line(88, ng0);
    t2 = ((char*)((ng1)));
    t4 = (t0 + 1928);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 32);

LAB41:    goto LAB2;

LAB7:    xsi_set_current_line(21, ng0);

LAB42:    xsi_set_current_line(22, ng0);
    t4 = (t0 + 2408);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t0 + 2568);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memset(t11, 0, 8);
    xsi_vlog_signed_add(t11, 32, t7, 32, t10, 32);
    t12 = (t0 + 1928);
    xsi_vlogvar_assign_value(t12, t11, 0, 0, 32);
    goto LAB41;

LAB9:    xsi_set_current_line(25, ng0);

LAB43:    xsi_set_current_line(26, ng0);
    t4 = (t0 + 2408);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t0 + 2568);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memset(t11, 0, 8);
    xsi_vlog_signed_minus(t11, 32, t7, 32, t10, 32);
    t12 = (t0 + 1928);
    xsi_vlogvar_assign_value(t12, t11, 0, 0, 32);
    xsi_set_current_line(27, ng0);
    t2 = (t0 + 1928);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);

LAB44:    t7 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 32, t7, 32);
    if (t6 == 1)
        goto LAB45;

LAB46:
LAB48:
LAB47:    xsi_set_current_line(29, ng0);
    t2 = ((char*)((ng1)));
    t4 = (t0 + 2088);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 1);

LAB49:    goto LAB41;

LAB11:    xsi_set_current_line(33, ng0);

LAB50:    xsi_set_current_line(34, ng0);
    t4 = (t0 + 1208U);
    t7 = *((char **)t4);
    t4 = (t0 + 1048U);
    t8 = *((char **)t4);
    t13 = *((unsigned int *)t7);
    t14 = *((unsigned int *)t8);
    t15 = (t13 & t14);
    *((unsigned int *)t11) = t15;
    t4 = (t7 + 4);
    t9 = (t8 + 4);
    t10 = (t11 + 4);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t9);
    t18 = (t16 | t17);
    *((unsigned int *)t10) = t18;
    t19 = *((unsigned int *)t10);
    t20 = (t19 != 0);
    if (t20 == 1)
        goto LAB51;

LAB52:
LAB53:    t40 = (t0 + 1928);
    xsi_vlogvar_assign_value(t40, t11, 0, 0, 32);
    goto LAB41;

LAB13:    xsi_set_current_line(37, ng0);

LAB54:    xsi_set_current_line(38, ng0);
    t4 = (t0 + 1208U);
    t7 = *((char **)t4);
    t4 = (t0 + 1048U);
    t8 = *((char **)t4);
    t13 = *((unsigned int *)t7);
    t14 = *((unsigned int *)t8);
    t15 = (t13 | t14);
    *((unsigned int *)t11) = t15;
    t4 = (t7 + 4);
    t9 = (t8 + 4);
    t10 = (t11 + 4);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t9);
    t18 = (t16 | t17);
    *((unsigned int *)t10) = t18;
    t19 = *((unsigned int *)t10);
    t20 = (t19 != 0);
    if (t20 == 1)
        goto LAB55;

LAB56:
LAB57:    t40 = (t0 + 1928);
    xsi_vlogvar_assign_value(t40, t11, 0, 0, 32);
    goto LAB41;

LAB15:    xsi_set_current_line(41, ng0);

LAB58:    xsi_set_current_line(42, ng0);
    t4 = (t0 + 1208U);
    t7 = *((char **)t4);
    t4 = (t0 + 1048U);
    t8 = *((char **)t4);
    t13 = *((unsigned int *)t7);
    t14 = *((unsigned int *)t8);
    t15 = (t13 ^ t14);
    *((unsigned int *)t11) = t15;
    t4 = (t7 + 4);
    t9 = (t8 + 4);
    t10 = (t11 + 4);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t9);
    t18 = (t16 | t17);
    *((unsigned int *)t10) = t18;
    t19 = *((unsigned int *)t10);
    t20 = (t19 != 0);
    if (t20 == 1)
        goto LAB59;

LAB60:
LAB61:    t12 = (t0 + 1928);
    xsi_vlogvar_assign_value(t12, t11, 0, 0, 32);
    goto LAB41;

LAB17:    xsi_set_current_line(45, ng0);

LAB62:    xsi_set_current_line(46, ng0);
    t4 = (t0 + 2408);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    t9 = (t0 + 2568);
    t10 = (t9 + 56U);
    t12 = *((char **)t10);
    memset(t11, 0, 8);
    xsi_vlog_signed_lshift(t11, 32, t8, 32, t12, 32);
    t23 = (t0 + 1928);
    xsi_vlogvar_assign_value(t23, t11, 0, 0, 32);
    goto LAB41;

LAB19:    xsi_set_current_line(49, ng0);

LAB63:    xsi_set_current_line(50, ng0);
    t4 = (t0 + 1208U);
    t7 = *((char **)t4);
    t4 = (t0 + 1048U);
    t8 = *((char **)t4);
    t13 = *((unsigned int *)t7);
    t14 = *((unsigned int *)t8);
    t15 = (t13 | t14);
    *((unsigned int *)t41) = t15;
    t4 = (t7 + 4);
    t9 = (t8 + 4);
    t10 = (t41 + 4);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t9);
    t18 = (t16 | t17);
    *((unsigned int *)t10) = t18;
    t19 = *((unsigned int *)t10);
    t20 = (t19 != 0);
    if (t20 == 1)
        goto LAB64;

LAB65:
LAB66:    memset(t11, 0, 8);
    t40 = (t11 + 4);
    t42 = (t41 + 4);
    t36 = *((unsigned int *)t41);
    t37 = (~(t36));
    *((unsigned int *)t11) = t37;
    *((unsigned int *)t40) = 0;
    if (*((unsigned int *)t42) != 0)
        goto LAB68;

LAB67:    t45 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t45 & 4294967295U);
    t46 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t46 & 4294967295U);
    t47 = (t0 + 1928);
    xsi_vlogvar_assign_value(t47, t11, 0, 0, 32);
    goto LAB41;

LAB21:    xsi_set_current_line(53, ng0);

LAB69:    xsi_set_current_line(54, ng0);
    t4 = (t0 + 2408);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    t9 = (t0 + 2568);
    t10 = (t9 + 56U);
    t12 = *((char **)t10);
    memset(t11, 0, 8);
    xsi_vlog_signed_rshift(t11, 32, t8, 32, t12, 32);
    t23 = (t0 + 1928);
    xsi_vlogvar_assign_value(t23, t11, 0, 0, 32);
    goto LAB41;

LAB23:    xsi_set_current_line(57, ng0);

LAB70:    xsi_set_current_line(58, ng0);
    t4 = (t0 + 1048U);
    t7 = *((char **)t4);
    t4 = (t0 + 1368U);
    t8 = *((char **)t4);
    memset(t11, 0, 8);
    xsi_vlog_unsigned_lshift(t11, 32, t7, 32, t8, 5);
    t4 = (t0 + 1928);
    xsi_vlogvar_assign_value(t4, t11, 0, 0, 32);
    goto LAB41;

LAB25:    xsi_set_current_line(61, ng0);

LAB71:    xsi_set_current_line(62, ng0);
    t4 = (t0 + 1048U);
    t7 = *((char **)t4);
    t4 = (t0 + 1368U);
    t8 = *((char **)t4);
    memset(t11, 0, 8);
    xsi_vlog_unsigned_rshift(t11, 32, t7, 32, t8, 5);
    t4 = (t0 + 1928);
    xsi_vlogvar_assign_value(t4, t11, 0, 0, 32);
    goto LAB41;

LAB27:    xsi_set_current_line(65, ng0);

LAB72:    xsi_set_current_line(66, ng0);
    t4 = (t0 + 1048U);
    t7 = *((char **)t4);
    t4 = ((char*)((ng13)));
    memset(t11, 0, 8);
    t8 = (t7 + 4);
    if (*((unsigned int *)t8) != 0)
        goto LAB74;

LAB73:    t9 = (t4 + 4);
    if (*((unsigned int *)t9) != 0)
        goto LAB74;

LAB77:    if (*((unsigned int *)t7) > *((unsigned int *)t4))
        goto LAB75;

LAB76:    t12 = (t0 + 1928);
    xsi_vlogvar_assign_value(t12, t11, 0, 0, 32);
    goto LAB41;

LAB29:    xsi_set_current_line(69, ng0);

LAB78:    xsi_set_current_line(70, ng0);
    t4 = (t0 + 1048U);
    t7 = *((char **)t4);
    t4 = ((char*)((ng13)));
    memset(t11, 0, 8);
    t8 = (t7 + 4);
    if (*((unsigned int *)t8) != 0)
        goto LAB80;

LAB79:    t9 = (t4 + 4);
    if (*((unsigned int *)t9) != 0)
        goto LAB80;

LAB83:    if (*((unsigned int *)t7) > *((unsigned int *)t4))
        goto LAB82;

LAB81:    *((unsigned int *)t11) = 1;

LAB82:    t12 = (t0 + 1928);
    xsi_vlogvar_assign_value(t12, t11, 0, 0, 32);
    goto LAB41;

LAB31:    xsi_set_current_line(73, ng0);

LAB84:    xsi_set_current_line(74, ng0);
    t4 = (t0 + 1208U);
    t7 = *((char **)t4);
    t4 = (t0 + 1048U);
    t8 = *((char **)t4);
    memset(t41, 0, 8);
    t4 = (t7 + 4);
    t9 = (t8 + 4);
    t13 = *((unsigned int *)t7);
    t14 = *((unsigned int *)t8);
    t15 = (t13 ^ t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t9);
    t18 = (t16 ^ t17);
    t19 = (t15 | t18);
    t20 = *((unsigned int *)t4);
    t21 = *((unsigned int *)t9);
    t22 = (t20 | t21);
    t24 = (~(t22));
    t25 = (t19 & t24);
    if (t25 != 0)
        goto LAB88;

LAB85:    if (t22 != 0)
        goto LAB87;

LAB86:    *((unsigned int *)t41) = 1;

LAB88:    memset(t11, 0, 8);
    t12 = (t11 + 4);
    t23 = (t41 + 4);
    t26 = *((unsigned int *)t41);
    t27 = (~(t26));
    *((unsigned int *)t11) = t27;
    *((unsigned int *)t12) = 0;
    if (*((unsigned int *)t23) != 0)
        goto LAB90;

LAB89:    t34 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t34 & 4294967295U);
    t35 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t35 & 4294967295U);
    t40 = (t0 + 1928);
    xsi_vlogvar_assign_value(t40, t11, 0, 0, 32);
    goto LAB41;

LAB33:    xsi_set_current_line(77, ng0);

LAB91:    xsi_set_current_line(78, ng0);
    t4 = (t0 + 2408);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    t9 = (t0 + 2568);
    t10 = (t9 + 56U);
    t12 = *((char **)t10);
    memset(t11, 0, 8);
    xsi_vlog_signed_less(t11, 32, t8, 32, t12, 32);
    t23 = (t0 + 1928);
    xsi_vlogvar_assign_value(t23, t11, 0, 0, 32);
    goto LAB41;

LAB35:    xsi_set_current_line(81, ng0);

LAB92:    xsi_set_current_line(82, ng0);
    t4 = (t0 + 1048U);
    t7 = *((char **)t4);
    t4 = (t0 + 1208U);
    t8 = *((char **)t4);
    memset(t11, 0, 8);
    xsi_vlog_unsigned_rshift(t11, 32, t7, 32, t8, 32);
    t4 = (t0 + 1928);
    xsi_vlogvar_assign_value(t4, t11, 0, 0, 32);
    goto LAB41;

LAB37:    xsi_set_current_line(85, ng0);

LAB93:    xsi_set_current_line(86, ng0);
    t4 = (t0 + 1048U);
    t7 = *((char **)t4);
    t4 = (t0 + 1208U);
    t8 = *((char **)t4);
    memset(t11, 0, 8);
    t4 = (t7 + 4);
    if (*((unsigned int *)t4) != 0)
        goto LAB95;

LAB94:    t9 = (t8 + 4);
    if (*((unsigned int *)t9) != 0)
        goto LAB95;

LAB98:    if (*((unsigned int *)t7) < *((unsigned int *)t8))
        goto LAB96;

LAB97:    t12 = (t0 + 1928);
    xsi_vlogvar_assign_value(t12, t11, 0, 0, 32);
    goto LAB41;

LAB45:    xsi_set_current_line(28, ng0);
    t8 = ((char*)((ng3)));
    t9 = (t0 + 2088);
    xsi_vlogvar_assign_value(t9, t8, 0, 0, 1);
    goto LAB49;

LAB51:    t21 = *((unsigned int *)t11);
    t22 = *((unsigned int *)t10);
    *((unsigned int *)t11) = (t21 | t22);
    t12 = (t7 + 4);
    t23 = (t8 + 4);
    t24 = *((unsigned int *)t7);
    t25 = (~(t24));
    t26 = *((unsigned int *)t12);
    t27 = (~(t26));
    t28 = *((unsigned int *)t8);
    t29 = (~(t28));
    t30 = *((unsigned int *)t23);
    t31 = (~(t30));
    t32 = (t25 & t27);
    t33 = (t29 & t31);
    t34 = (~(t32));
    t35 = (~(t33));
    t36 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t36 & t34);
    t37 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t37 & t35);
    t38 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t38 & t34);
    t39 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t39 & t35);
    goto LAB53;

LAB55:    t21 = *((unsigned int *)t11);
    t22 = *((unsigned int *)t10);
    *((unsigned int *)t11) = (t21 | t22);
    t12 = (t7 + 4);
    t23 = (t8 + 4);
    t24 = *((unsigned int *)t12);
    t25 = (~(t24));
    t26 = *((unsigned int *)t7);
    t32 = (t26 & t25);
    t27 = *((unsigned int *)t23);
    t28 = (~(t27));
    t29 = *((unsigned int *)t8);
    t33 = (t29 & t28);
    t30 = (~(t32));
    t31 = (~(t33));
    t34 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t34 & t30);
    t35 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t35 & t31);
    goto LAB57;

LAB59:    t21 = *((unsigned int *)t11);
    t22 = *((unsigned int *)t10);
    *((unsigned int *)t11) = (t21 | t22);
    goto LAB61;

LAB64:    t21 = *((unsigned int *)t41);
    t22 = *((unsigned int *)t10);
    *((unsigned int *)t41) = (t21 | t22);
    t12 = (t7 + 4);
    t23 = (t8 + 4);
    t24 = *((unsigned int *)t12);
    t25 = (~(t24));
    t26 = *((unsigned int *)t7);
    t32 = (t26 & t25);
    t27 = *((unsigned int *)t23);
    t28 = (~(t27));
    t29 = *((unsigned int *)t8);
    t33 = (t29 & t28);
    t30 = (~(t32));
    t31 = (~(t33));
    t34 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t34 & t30);
    t35 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t35 & t31);
    goto LAB66;

LAB68:    t38 = *((unsigned int *)t11);
    t39 = *((unsigned int *)t42);
    *((unsigned int *)t11) = (t38 | t39);
    t43 = *((unsigned int *)t40);
    t44 = *((unsigned int *)t42);
    *((unsigned int *)t40) = (t43 | t44);
    goto LAB67;

LAB74:    t10 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t10) = 1;
    goto LAB76;

LAB75:    *((unsigned int *)t11) = 1;
    goto LAB76;

LAB80:    t10 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t10) = 1;
    goto LAB82;

LAB87:    t10 = (t41 + 4);
    *((unsigned int *)t41) = 1;
    *((unsigned int *)t10) = 1;
    goto LAB88;

LAB90:    t28 = *((unsigned int *)t11);
    t29 = *((unsigned int *)t23);
    *((unsigned int *)t11) = (t28 | t29);
    t30 = *((unsigned int *)t12);
    t31 = *((unsigned int *)t23);
    *((unsigned int *)t12) = (t30 | t31);
    goto LAB89;

LAB95:    t10 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t10) = 1;
    goto LAB97;

LAB96:    *((unsigned int *)t11) = 1;
    goto LAB97;

}


extern void work_m_10262353072562552370_0886308060_init()
{
	static char *pe[] = {(void *)Always_12_0};
	xsi_register_didat("work_m_10262353072562552370_0886308060", "isim/testbench_isim_beh.exe.sim/work/m_10262353072562552370_0886308060.didat");
	xsi_register_executes(pe);
}
