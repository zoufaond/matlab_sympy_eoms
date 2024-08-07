function fe = fe(t,in2,in3,in4,in5)
%FE
%    FE = FE(T,IN2,IN3,IN4,IN5)

%    This function was generated by the Symbolic Math Toolbox version 9.3.
%    26-Feb-2024 10:36:53

F_iso1 = in3(:,1);
F_iso2 = in3(:,2);
F_iso3 = in3(:,3);
akt1 = in5(:,1);
akt2 = in5(:,2);
akt3 = in5(:,3);
l0m1 = in4(:,1);
l0m2 = in4(:,2);
l0m3 = in4(:,3);
q1 = in2(:,1);
q2 = in2(:,2);
q3 = in2(:,3);
q4 = in2(:,4);
q5 = in2(:,5);
q6 = in2(:,6);
t2 = conj(F_iso1);
t3 = conj(F_iso2);
t4 = conj(F_iso3);
t5 = conj(akt1);
t6 = conj(akt2);
t7 = conj(akt3);
t8 = conj(l0m1);
t9 = conj(l0m2);
t10 = conj(l0m3);
t11 = conj(q1);
t12 = conj(q2);
t13 = conj(q3);
t14 = conj(q4);
t15 = conj(q5);
t16 = conj(q6);
t17 = cos(q1);
t18 = cos(q2);
t19 = cos(q3);
t20 = cos(q4);
t21 = cos(q5);
t22 = cos(q6);
t23 = sin(q1);
t24 = sin(q2);
t25 = sin(q3);
t26 = sin(q4);
t27 = sin(q5);
t28 = sin(q6);
t29 = cos(t11);
t30 = cos(t12);
t31 = cos(t13);
t32 = cos(t14);
t33 = cos(t15);
t34 = cos(t16);
t35 = sin(t11);
t36 = sin(t12);
t37 = sin(t13);
t38 = sin(t14);
t39 = sin(t15);
t40 = sin(t16);
t41 = t27.*3.0;
t42 = t17.*t19;
t43 = t18.*t19;
t44 = t20.*t22;
t45 = t21.*t22;
t46 = t17.*t25;
t47 = t19.*t23;
t48 = t18.*t25;
t49 = t20.*t28;
t50 = t22.*t26;
t51 = t23.*t25;
t52 = t26.*t28;
t53 = 1.0./t8;
t54 = 1.0./t9;
t56 = 1.0./t10;
t59 = t24.*1.0e+1;
t61 = t20.*t21.*3.0;
t63 = t21.*t26.*3.0;
t65 = t21.*t28.*6.0;
t70 = t17.*t18.*1.0e+1;
t74 = t18.*t23.*1.0e+1;
t143 = t18.*t20.*t21.*t23.*-1.0e+1;
t55 = t53.^3;
t57 = t54.^3;
t58 = t56.^3;
t60 = t39.*3.0;
t62 = t44.*6.0;
t64 = t50.*6.0;
t66 = t30.*1.0e+1;
t67 = t36.*1.0e+1;
t69 = -t61;
t71 = t24.*t51;
t72 = t27.*t52;
t75 = -t52;
t76 = t29.*t31;
t77 = t30.*t31;
t78 = t32.*t34;
t79 = t33.*t34;
t80 = t29.*t37;
t81 = t31.*t35;
t82 = t30.*t37;
t83 = t32.*t40;
t84 = t34.*t38;
t85 = t24.*t42;
t86 = t27.*t44;
t87 = t35.*t37;
t88 = t38.*t40;
t89 = t24.*t46;
t90 = t24.*t47;
t91 = t27.*t49;
t92 = t27.*t50;
t93 = -t70;
t95 = -t74;
t96 = t32.*t33.*3.0;
t98 = t33.*t38.*3.0;
t100 = t33.*t40.*6.0;
t105 = t43.*t45;
t106 = t21.*t28.*t43;
t115 = t27.*t43.*1.0e+1;
t116 = t20.*t21.*t59;
t128 = t29.*t30.*-1.0e+1;
t129 = t30.*t35.*-1.0e+1;
t132 = t20.*t21.*t70;
t134 = t21.*t26.*t48.*1.0e+1;
t159 = t41+t45+t65+4.0;
t192 = (t43-t48-t59+1.0e+1).^2;
t94 = t72.*6.0;
t97 = t78.*6.0;
t99 = t84.*6.0;
t101 = t91.*6.0;
t102 = -t71;
t103 = -t72;
t107 = -t77;
t108 = -t96;
t109 = t29.*t66;
t111 = t29.*t67;
t112 = t35.*t66;
t113 = -t85;
t114 = -t86;
t117 = -t88;
t118 = t35.*t67;
t120 = t36.*t76;
t121 = t39.*t78;
t122 = t36.*t80;
t123 = t36.*t81;
t124 = t39.*t83;
t125 = t39.*t84;
t126 = t36.*t87;
t127 = t39.*t88;
t137 = t31.*t39.*t66;
t138 = t32.*t33.*t67;
t144 = t77.*t79;
t145 = t33.*t40.*t77;
t146 = t46+t90;
t147 = t47+t89;
t148 = t49+t92;
t149 = t50+t91;
t152 = t33.*t37.*t38.*t66;
t157 = t32.*t33.*t129;
t172 = t159.^2;
t191 = t60+t79+t100+4.0;
t130 = t124.*6.0;
t131 = t127.*6.0;
t135 = -t120;
t136 = -t121;
t140 = -t126;
t141 = t39.*t117;
t150 = t32.*t33.*t109;
t153 = t42+t102;
t154 = t51+t113;
t155 = t44+t103;
t156 = t52+t114;
t158 = t24.*t149;
t160 = t80+t123;
t161 = t81+t122;
t162 = t83+t125;
t163 = t84+t124;
t164 = t45.*t146;
t165 = t17.*t18.*t149;
t166 = t21.*t28.*t146;
t167 = t18.*t23.*t149;
t168 = t48.*t148;
t169 = t27.*t146.*1.0e+1;
t182 = t21.*t26.*t147.*1.0e+1;
t203 = t67+t82+t107-1.0e+1;
t212 = t147.*t148;
t226 = t64+t69+t75+t86+t101+1.0e+1;
t232 = (t62+t63-t94-t148+5.0).^2;
t170 = t24.*t156;
t171 = -t158;
t173 = t76+t140;
t174 = t87+t135;
t175 = t78+t141;
t176 = t88+t136;
t177 = t45.*t154;
t178 = t17.*t18.*t156;
t179 = -t165;
t180 = t21.*t28.*t154;
t181 = t18.*t23.*t156;
t183 = t48.*t155;
t184 = -t168;
t185 = t27.*t154.*1.0e+1;
t186 = -t182;
t188 = t36.*t163;
t190 = t21.*t26.*t153.*1.0e+1;
t194 = t39.*t160.*1.0e+1;
t197 = t79.*t160;
t198 = t29.*t30.*t163;
t199 = t33.*t40.*t160;
t200 = t30.*t35.*t163;
t201 = t82.*t162;
t209 = t33.*t38.*t161.*1.0e+1;
t216 = t147.*t155;
t217 = t148.*t153;
t219 = t153.*t155;
t222 = t93+t147+t154;
t223 = t161.*t162;
t224 = t74+t146+t153-1.2e+1;
t231 = t226.^2;
t238 = t99+t108+t117+t121+t130+1.0e+1;
t189 = -t181;
t193 = -t190;
t195 = t36.*t176;
t196 = -t188;
t202 = t39.*t174.*1.0e+1;
t204 = t79.*t174;
t205 = t29.*t30.*t176;
t206 = -t198;
t207 = t33.*t40.*t174;
t208 = t30.*t35.*t176;
t210 = t82.*t175;
t211 = -t201;
t213 = -t209;
t215 = t33.*t38.*t173.*1.0e+1;
t220 = -t216;
t221 = -t219;
t225 = t222.^2;
t227 = t224.^2;
t228 = t161.*t175;
t229 = t162.*t173;
t233 = t173.*t175;
t236 = t128+t161+t174;
t237 = t112+t160+t173-1.2e+1;
t241 = t172+t231+t232;
t272 = t59+t105+t106+t115+t116+t134+t170+t171+t183+t184-1.0e+1;
t214 = -t208;
t218 = -t215;
t234 = -t228;
t235 = -t233;
t240 = t192+t225+t227;
t246 = sqrt(t241);
t273 = t272.^2;
t274 = t67+t137+t138+t144+t145+t152+t195+t196+t210+t211-1.0e+1;
t275 = t70+t132+t177+t178+t179+t180+t185+t186+t212+t220;
t277 = t95+t143+t164+t166+t167+t169+t189+t193+t217+t221+1.2e+1;
t242 = sqrt(t240);
t247 = t246.^3;
t248 = conj(t246);
t276 = t275.^2;
t278 = t277.^2;
t281 = t109+t150+t202+t204+t205+t206+t207+t213+t223+t234;
t282 = t129+t157+t194+t197+t199+t200+t214+t218+t229+t235+1.2e+1;
t243 = t242.^3;
t244 = conj(t242);
t249 = conj(t247);
t251 = 1.0./t248;
t253 = t56.*t248;
t285 = t273+t276+t278;
t245 = conj(t243);
t250 = 1.0./t244;
t252 = t53.*t244;
t256 = t253.*8.0;
t257 = t253-1.0;
t286 = sqrt(t285);
t254 = t252.*8.0;
t255 = t252-1.0;
t259 = t257.^2;
t267 = t256-1.29e+2./1.0e+1;
t287 = t286.^3;
t288 = conj(t286);
t258 = t255.^2;
t262 = t259.*4.0;
t265 = t254-1.29e+2./1.0e+1;
t270 = exp(t267);
t289 = conj(t287);
t290 = 1.0./t288;
t291 = t54.*t288;
t260 = t258.*4.0;
t264 = -t262;
t268 = exp(t265);
t280 = t58.*t249.*t270;
t292 = t291.*8.0;
t293 = t291-1.0;
t261 = -t260;
t266 = exp(t264);
t279 = t55.*t245.*t268;
t294 = t293.^2;
t298 = t292-1.29e+2./1.0e+1;
t263 = exp(t261);
t271 = t7.*t266;
t295 = t294.*4.0;
t299 = exp(t298);
t269 = t5.*t263;
t284 = t271+t280;
t296 = -t295;
t301 = t57.*t289.*t299;
t283 = t269+t279;
t297 = exp(t296);
t300 = t6.*t297;
t302 = t300+t301;
et1 = t4.*t251.*t284.*(t238.*(t32.*t60+t33.*t78+t33.*t83.*6.0).*-2.0+(t38.*t60+t38.*t79+t33.*t88.*6.0).*(t97+t98-t131-t162+5.0).*2.0+t191.*(t33.*-3.0+t34.*t39+t39.*t40.*6.0).*2.0).*(-1.0./2.0);
et2 = t3.*t290.*t302.*(t282.*(t33.*t160.*1.0e+1+t32.*t39.*t112-t34.*t39.*t160-t39.*t40.*t160+t38.*t39.*t173.*1.0e+1+t38.*t79.*t173+t33.*t88.*t173+t30.*t33.*t35.*t78+t30.*t33.*t35.*t83).*-2.0+t281.*(t33.*t174.*-1.0e+1+t32.*t39.*t109-t38.*t39.*t161.*1.0e+1+t34.*t39.*t174+t39.*t40.*t174-t38.*t79.*t161+t33.*t117.*t161+t29.*t30.*t33.*t78+t29.*t30.*t33.*t83).*2.0+t274.*(t33.*t77.*-1.0e+1+t32.*t39.*t67+t33.*t36.*t78+t34.*t39.*t77+t33.*t36.*t83+t39.*t40.*t77+t38.*t79.*t82+t33.*t82.*t88+t37.*t38.*t39.*t66).*2.0).*(-1.0./2.0);
mt1 = [0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;t3.*t290.*t302.*(t281.*t282.*2.0-t281.*(t129+t157+t194+t197+t199+t200+t214+t218+t229+t235).*2.0).*(-1.0./2.0)-(t2.*t250.*t283.*(t236.*t237.*2.0-t236.*(t112+t160+t173).*2.0))./2.0];
mt2 = [(t2.*t250.*t283.*(t203.*(t66+t31.*t36-t36.*t37).*2.0+t236.*(t111-t30.*t76+t30.*t80).*2.0-t237.*(t118+t35.*t82+t35.*t107).*2.0))./2.0-(t3.*t290.*t302.*(t281.*(t111+t29.*t195+t29.*t196+t32.*t33.*t111+t39.*t66.*t76+t30.*t76.*t79-t30.*t80.*t162+t30.*t80.*t175+t30.*t33.*t40.*t76+t33.*t38.*t66.*t80).*2.0+t274.*(-t66+t30.*t163-t30.*t176-t30.*t32.*t33.*1.0e+1+t31.*t39.*t67+t31.*t36.*t79-t36.*t37.*t162+t36.*t37.*t175+t31.*t33.*t36.*t40+t33.*t37.*t38.*t67).*2.0-t282.*(t118+t35.*t144+t35.*t145+t35.*t195+t35.*t196+t35.*t210+t35.*t211+t32.*t33.*t118+t39.*t66.*t81+t33.*t38.*t66.*t87).*2.0))./2.0];
mt3 = [(t2.*t250.*t283.*(t203.*(t77+t82).*2.0-t237.*(-t76+t126+t160).*2.0+t236.*(-t87+t120+t161).*2.0))./2.0+(t3.*t290.*t302.*(t274.*(t79.*t82+t77.*t162+t107.*t175+t37.*t39.*t66-t33.*t38.*t77.*1.0e+1+t33.*t40.*t82).*-2.0+t282.*(t39.*t173.*1.0e+1+t79.*t173-t160.*t162+t160.*t175+t33.*t38.*t160.*1.0e+1+t33.*t40.*t173).*2.0+t281.*(t39.*t161.*1.0e+1+t79.*t161-t162.*t174+t174.*t175+t33.*t40.*t161+t33.*t38.*t174.*1.0e+1).*2.0))./2.0];
mt4 = [(t3.*t290.*t302.*(t274.*(t36.*t162-t36.*t175-t82.*t163+t82.*t176-t33.*t36.*t38.*1.0e+1+t32.*t33.*t37.*t66).*2.0-t281.*(-t161.*t163+t161.*t176+t33.*t38.*t109-t29.*t30.*t162+t32.*t33.*t161.*1.0e+1+t29.*t30.*t175).*2.0+t282.*(t163.*t173-t173.*t176+t33.*t38.*t112-t30.*t35.*t162-t32.*t33.*t173.*1.0e+1+t30.*t35.*t175).*2.0))./2.0+(t4.*t251.*t284.*(t238.*(t97+t98-t131-t162).*2.0-(t99+t108+t117+t121+t130).*(t97+t98-t131-t162+5.0).*2.0))./2.0;et1+et2];
mt5 = [(t3.*t290.*t302.*(t281.*(t198+t204+t205-t207+t223+t228).*2.0+t274.*(t144+t188+t195-t210+t211+t33.*t40.*t107).*2.0+t282.*(t197-t199-t200+t214+t229+t233).*2.0))./2.0-(t4.*t251.*t284.*((t83.*6.0+t175+t39.*t99).*(t97+t98-t131-t162+5.0).*2.0-t191.*(t79.*6.0-t33.*t40).*2.0+t238.*(t88.*6.0-t121.*6.0+t163).*2.0))./2.0;0.0;0.0;0.0];
fe = [mt1;mt2;mt3;mt4;mt5];
end
