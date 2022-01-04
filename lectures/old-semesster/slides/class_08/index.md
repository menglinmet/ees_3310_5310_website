---
title: "Climate Feedbacks"
class_no: 8
class_date: "Wednesday, February 10"
qrimage: qrcode.png
pageurl: "ees3310.jgilligan.org/slides/class_08"
pdfurl: "ees3310.jgilligan.org/slides/class_08/ees_3310_5310_class_08_slides.pdf"
course: "EES 3310/5310"
course_name: "Global Climate Change"
author: "Jonathan Gilligan"
semester: Spring
year: 2021
output:
  revealjg::revealjs_presentation
---

# Lapse Rates {#lapse-rate-sec .center}

## Which lapse rate is greater? {.center}

<br/>

</center>
<table style="border:none;">
<tr style="border:none;">
<td style="border:none;">
<div>

![](assets/fig/lapse.a-1.png)
</div>
</td>
<td style="border:none;">
<div class="fragment grow">

![](assets/fig/lapse.b-1.png)

</div>
</td></tr></table></center>

## Lapse Rates

![](assets/fig/lapses-1.png)

# Feedback {#feedback1-sec .center}

## Feedback {#feedback1}

* $Q$ is net heat flow into the earth:
  * $Q = I_{\text{in}} - I_{\text{out}}$, 
* {+} **At Start:** $Q = I_{\text{in}} - I_{\text{out}} = 0$, 
  * $T_{\text{ground}} = T_0$.
* {+} **Forcing:** change $Q \rightarrow Q_{\text{forcing}} > 0$
  * {+} What happens?
* {+} **Response:** $T_{\text{ground}} \rightarrow T_0 + \Delta T$
  * {+} **Normally**, $\Delta T$ brings $I_{\text{out}}$ back to balance with 
    $I_{\text{in}}$.
  * {+} **With feedback**, $\Delta T$ causes a new forcing, 
  
    $\Delta Q_{\text{feedback}} = f \Delta T$
  * {+} $\Delta Q_{\text{feedback}}$ causes further change in $T_{\text{ground}}$.

# Examples of feedbacks {#feedback-examples .center}

## Ice-Albedo {#ice-albedo .blacktitle .blacktext .eighty data-background="assets/images/icealbedo.png" data-background-size="100% 100%"}

* {+ 1} Albedo of ice is around 0.95
* {+ 1} Albedo of ocean water is around 0.05

:::::: {.columns .fragment data-fragment-index="2"}
::: {.column .darkredtext}
* Temperature rises ($\Delta T > 0$)
  * {+ 3} Ice recedes
  * {+ 4} Albedo gets smaller
  * {+ 5} More sunlight absorbed
  * {+ 6} $\Delta Q > 0$
  * {+ 7} $\displaystyle\frac{\Delta Q}{\Delta T} > 0$
    * Positive feedback
:::
::: {.column .darkbluetext}
* Temperature falls ($\Delta T < 0$)
  * {+ 3} Ice grows
  * {+ 4} Albedo gets larger
  * {+ 5} Less sunlight absorbed
  * {+ 6} $\Delta Q < 0$
  * {+ 7} $\displaystyle\frac{\Delta Q}{\Delta T} > 0$
    * Positive feedback
:::
::::::

## Water-vapor {#water-vapor}

::: {style="margin-top:1rem;"}
* Temperature rises
* {+} What happens to humidity?
  * {+} Humidity rises: more water vapor
* {+} How does this affect $\Delta Q$?
  * {+} More water vapor $\rightarrow$ bigger greenhouse effect
  * {+} $I_{\text{out}}$ gets smaller
  * {+} $\Delta Q = \Delta(I_{\text{in}} - I_{\text{out}}) > 0$
  * {+} Positive $\Delta T \rightarrow \text{Positive}~\Delta Q$
    * $f = \Delta Q / \Delta T > 0$: positive feedback
:::

## Greenhouse effect {#gw-baseline-2 .ninety data-transition="fade"}

![](assets/fig/baseline.conv.gh-1.png)

* Ground temp: $T_{\text{ground}} = T_{\text{skin}} + h_{\text{skin}} \times \text{env. lapse}$

## Global warming {#gw-convect-2 .ninety data-transition="fade"}

![](assets/fig/warm.conv.gh-1.png)

* Greater CO~2~ $\rightarrow$ greater skin height.
* Warming: $\Delta T_{\text{ground}} = \Delta h_{\text{skin}} \times \text{env. lapse}$
* {+} What does rising temperature do to water vapor?

## Water Vapor Feedback {#wv-feedback .ninety data-transition="fade"}

![](assets/fig/h2o.feedback.1-1.png)

* Rising temperature $\rightarrow$ greater humidity
* Greater humidity $\rightarrow$ skin height rises even higher
* $\Delta T_{\text{ground}} = \Delta h_{\text{skin}} \times \text{Lapse}$

# **Interlude: Volcanic & Nuclear Winter** {#nuclear_winter_sec .yellowtitle .toptitle  data-transition="fade" data-background-transition="fade" data-background="assets/images/pinatubo_1.jpg" data-background-size="contain" data-background-color="black"}

## **Mt. Pinatubo, Philippines, 1991** {#nuclear_winter .yellowtitle .toptitle  data-transition="fade" data-background-transition="fade" data-background="assets/images/pinatubo_1.jpg" data-background-size="contain" data-background-color="black"}

::: notes
* Erupted June 12--15, 1991. (Dominant eruption on the 15th)
* 10 km^3^ of ash (10 billion tonnes)
* 17 million tonnes (19 short tons) sulfate.
* Reduced the amount of sunlight by 10%
* Reduced global temperature by 0.5&deg;C
:::

## Cloud Spreads {#cloud_spreads .yellowtitle data-background="assets/images/pinatubo_cloud_1.jpg" data-transition="fade" data-background-transition="fade" data-background-size="cover"}

## Around the planet

![Pinatubo Cloud](assets/images/pinatubo_cloud2_1.jpg){style="height:900px;"}

::: notes
* Erupted June 12--15, 1991. (Dominant eruption on the 15th)
* 10 km^3^ of ash (10 billion tonnes)
* 17 million tonnes (19 short tons) sulfate.
* Reduced the amount of sunlight by 10%
* Reduced global temperature by 0.5&deg;C
:::

## Cloud blocks sunlight

![Volcanic Solar Intensity](assets/images/volcano_solar_1.png){style="height:900px;"}

::: notes
* Pinatubo June 15 1991 (10% reduction in sunlight, 0.5^deg;C global cooling)
* El Chichon Mar/Apr 1982 (7 million tonnes sulfate, 20 million tonnes ash)
:::

## Exercise 3-3

![Homework Problem](assets/images/ar03f06.png){style="height:900px;"}

## Temperature drops

![Pinatubo Temperature](assets/images/temp_pinatubo.jpg){style="height:900px;"}

::: notes
* Erupted June 12--15, 1991. (Dominant eruption on the 15th)
* 10 km^3^ of ash (10 billion tonnes)
* 17 million tonnes (19 short tons) sulfate.
* Reduced the amount of sunlight by 10%
* Reduced global temperature by 0.5&deg;C
:::

## Volcanoes and Temperature

![Volcanic eruptions and temperature](assets/images/volcano_temperature_1.png){style="width:1900px;"}

::: notes
* Erupted June 12--15, 1991. (Dominant eruption on the 15th)
* 41 km^3^ of ash (10 billion tonnes)
* 17 million tonnes (19 short tons) sulfate.
* Reduced the amount of sunlight by 10%
* Reduced global temperature by 0.5&deg;C
:::

## [**1816: <br/>The Year Without a Summer**]{.fragment} {#year_without_summer .yellowtitle .toptitle data-background-color="black" data-background="assets/images/whitten_grave.jpg" data-background-size="contain" data-transition="fade" data-background-transition="fade"}

::: notes
* Mt. Tambora
* Big eruption April 10 1815
* 10 km^3^ of ash (10 billion tonnes)
* 10--100 million tonnes sulfate.
* Reduced global temperature by ~1&deg;C (Berkeley Earth)
* Coldest summer on record in Europe from 1766 to the present
* Largest eruption in the last 1,500 years
* Floods and famine in Asia from China to India
* Crop failures throughout Europe
* Spectacular sunsets may have inspired painters such as J.M.W. Turner
  (see, e.g., C.S. Zerefos et al., Atmos. Chem. Phys. **7**, 4027 (2007)
  https://doi.org/10.5194/acp-7-4027-2007)
:::

## Testing Theory of Water-Vapor Feedback {.eighty}

![Pinatubo Water Vapor Feedback](assets/images/pinatubo_wvfeedback.jpg){style="height:700px;"}

* {+} Pinatubo erupts
* {+} Model calculations with water vapor feedback correctly predict cooling
* {+} Turn off water vapor feedback: incorrect predictions

## Additional Tests

![Water Vapor Feedback](assets/images/w_v_feedback_test.png){style="height:900px;"}

# Runaway Greenhouse {#runaway-sec data-background="assets/images/runaway_greenhouse_bg.png" data-transition="fade" data-background-transition="fade-out" data-background-size="100% 100%"}

<!---
## Runaway Greenhouse {#runaway .ninety data-transition="fade" data-background-transition="fade"}

:::::: {.columns}
::: {.column .eighty style="padding-top:1em;"}

* Equilibrium vapor pressure: $p_{\text{eq}}(T)$ 
  * Blue curve
* Actual vapor pressure $p$
* {+} If $p_{\text{eq}}(T) > p$, then $p$ will rise.
* {+} Rising $p \rightarrow$ greenhouse effect: $T$ increases
* {+} Rising $T \rightarrow p_{\text{eq}}(T)$ increases.
* {+} Equilibrium when $p = p_{\text{eq}}(T)$
* {+} Lower starting temperature:
  * Lower vapor pressure
  * {+} Smaller greenhouse effect
  * {+} As $p$ rises, $T$ doesn't rise much
  * {+} Reaches equilibrium where $p = p_{\text{eq}}(T)$
* {+} Higher starting temperature:
  * Higher vapor pressure
  * {+} Larger greenhouse effect
  * {+} As $p$ rises, $T$ rises a lot
* {+} If vapor pressure curve does not hit equilibrium with water or ice, 
  greenhouse will run away:
  * Water will keep evaporating until oceans are dry.
:::
::: {.column}
![](assets/fig/runaway_greenhouse-1.png)

:::
::::::
-->

## Andrew Ingersoll & Runaway Greenhouse {#Ingersoll_1 data-transition=fade}

:::::: {.columns}
::: {.column style="padding-top:1em;"}
### 1967: First class he ever taught

* {+} Assigned homework:
  * Calculate water vapor feedback
* {+} Students couldn't solve problem
* {+} Fixed problem so students could solve it
* {+} It worked for Earth, but not Venus
* {+}  Hmmmm  ...
* {+} It would work for Venus if all the oceans boiled dry.
:::
::: {.column}
![Andrew Ingersoll](assets/images/Ingersoll.jpg){style="height:900px;"}
:::
::::::

## Andrew Ingersoll & Runaway Greenhouse {#Ingersoll_2 data-transition=fade}

:::::: {.columns}
::: {.column style="padding-top:1em;"}
### Wrote up results for publication

* {+} Rejected by journal
* {+} Submitted to another journal
  * {+} Rejected again
* {+} Submitted to a third journal
  * {+} Accepted
* {+} Now a classic paper 
  * Cited more than 200 times
:::
::: {.column}
![Andrew Ingersoll](assets/images/Ingersoll.jpg){style="height:900px;"}
:::
::::::

## Kombayashi-Ingersoll Limit

:::::: {.columns}
::: {.column .eighty style="padding-top:1em;"}
* $S$ = Incoming sunlight
* Outgoing long-wave has to balance incoming sunlight $S$
* {+} Curves = relationship between temperature and outgoing radiation
  * [no feedback]{style="color:red;"}, 
    [feedback]{style="color:blue;"},
    [feedback + high CO~2~]{style="color:black;"}
* {+} Brighter sun $\rightarrow$ hotter $\rightarrow$ more water vapor
* {+} Water vapor absorbs outgoing radiation
* {+} Absorption $\rightarrow$ hotter $\rightarrow$ more vapor
* {+} Kombayashi-Ingersoll limit:
  * Sunlight below limit, there is a stable equilibrium with liquid water
  * Sunlight above limit, oceans boil dry
:::
::: {.column}

![Kombayashi-Ingersoll Limit](assets/images/kombayashi-ingersoll.jpg)

:::
::::::

# Cloud Feedbacks {#cloud-feedbacks-sec .blacktitle data-background="assets/images/clouds-001-1024x768.jpg" data-transition="fade" data-background-transition="fade" data-background-size="100% 100%"}

## Cloud Feedbacks  {#cloud-feedbacks-1 data-transition="fade" data-background-transition="fade"}

* What effect do clouds have on climate?
* {+} What effects does climate have on clouds?
* {+} Warmer $\rightarrow$ more clouds
* {+} More clouds:
  * {+} Higher albedo 
    * (cools earth: negative feedback)
  * {+} High emissivity: blocks longwave light 
    * (warms earth: positive feedback)
* {+} Which effect is bigger?

## Cirrus Clouds (High)  {#cloud-feedbacks-2 .yellowtitle data-background="assets/images/cirrus.jpg" data-transition="fade" data-background-transition="fade" data-background-size="100% 100%"}

## Stratus Clouds (Low) {#cloud-feedbacks-3 .blacktitle data-background="assets/images/stratus.jpg" data-transition="fade" data-background-transition="fade" data-background-size="100% 100%"}

## Cloud Feedbacks {#cloud-feedbacks-4 data-transition="fade" data-background-transition="fade"}

![Cloud Feedbacks](assets/images/cloud_feedback_2.png){style="height:900px;"}

## Satellite Measurements {#cloud-feedbacks-5 data-transition="fade" data-background-transition="fade"}

### Radiative forcing by clouds 

![Satellite Measurement of radiative forcing by clouds](assets/images/satellite_clouds.jpg){style="height:750px;"}

(negative = cooling, positive = warming)

# Indirect Aerosol Effect {#indirect-aerosol-sec .yellowtitle  data-transition="fade" data-background-transition="fade" data-background="assets/images/pacific_tmo_2009063_crop.jpg" data-background-size="100% 100%"}

## Indirect Aerosol Effect {#indirect-aerosol .ninety  data-transition="fade" data-background-transition="fade"}

* Aerosol particles $\rightarrow$ more, smaller droplets
* Smaller droplets $\rightarrow$ greater albedo, longer lifetime
* More droplets $\rightarrow$ greater albedo, more absorption

![Indirect Aerosol Effect](assets/images/houghton3-9.jpg){style="height:730px;"}

## Indirect Aerosol Effect {#indirect-aerosol-2}

![Ships and Clouds](assets/images/indirect_aerosol_ships.jpg){style="height:900px;"}

# Summary of Feedbacks {#feedback-summary-sec .center data-transition="fade-out"}

## Summary of Feedbacks {#feedback-summary data-transition="fade-in"}

<!--
![Summary of feedbacks](assets/images/feedback_summary.png){style="height:900px;"}
-->

* Ice-Albedo has been extensively studied: 
  * It's known to be moderately positive.
* {+} Water vapor has been studied: 
  * It's known to be strongly positive (factor of 2).
* {+} There is some uncertainty about clouds: 
  * Most likely they're positive, 
  * Strength is very uncertain

## Stefan-Boltzmann Feedback

* The biggest feedback in the climate system is the Stefan-Boltzmann feedback.
* {+} Stefan-Boltzmann equation: $I = \varepsilon \sigma T^4$ 
  * {+} $Q = Q_{\text{in}} - Q_{\text{out}}$
  * {+} Higher temperature $\rightarrow$ more heat out to space
    * $Q_{\text{out}}$ gets larger, so $\Delta Q < 0$
  * {+} $\Delta T > 0 \rightarrow \Delta Q < 0$
  * {+} $\displaystyle f = \frac{\Delta Q}{\Delta T} < 0$: negative feedback
* {+} Creates stable climate

## Stability of the Climate {#stability .ninety}

* Most feedbacks we've discussed are positive:
  * Ice-albedo
  * Water vapor
  * Clouds (mostly)
* {+} Why don't these positive feedbacks make the climate unstable? 
  * (e.g., runaway greenhouse)
  * {+} They are smaller than the negative Stefan-Boltzmann feedback
    * so the total feedback remains negative.
  * {+} Positive feedbacks amplify warming: 
    * More than we'd get with just Stefan-Boltzmann feedback, 
    * But they are too small to destabilize the planet.
* {+} Many scientists worry about a possible "tipping point":
  * {+} Is there a temperature threshold where positive feedbacks become greater than Stefan-Boltzmann?
    * This would destabilize the climate.
