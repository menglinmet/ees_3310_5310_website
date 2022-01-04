---
title: "Greenhouse Gases"
class_no: 5
class_date: "Wednesday, February 3"
qrimage: qrcode.png
pageurl: "ees3310.jgilligan.org/slides/class_05"
pdfurl: "ees3310.jgilligan.org/slides/class_05/ees_3310_5310_class_05_slides.pdf"
course: "EES 3310/5310"
course_name: "Global Climate Change"
author: "Jonathan Gilligan"
semester: Spring
year: 2021
output:
  revealjg::revealjs_presentation
---


# Lab #2 Assignment, Part 2: {.center}

## General Principles: {#general_principles .center .eighty}

### Start at the top and work down:

#. {+} Balance budget at boundary to space
   * {+} Get "skin temperature" (top layer)
#. {+} Balance budget at top layer of atmosphere
   * {+} Get temp. of next layer down (2^nd^ from top)
#. {+} Balance budget at next layer of atmosphere
   * {+} Get temp. of next layer down (3^rd^ from top)
#. {+} ...
#. {+} Balance budget at bottom layer of atmosphere
   * {+} This gives surface (ground) temperature.

. . .

::: {.darkredtext style="margin:20px;margin-top:50px;"}

As long as the albedo and the solar constant don't change, 
***the skin temperature is always the same***
for all models: 
254 K.

:::

::: {.credit style="font-size:200%;"}
--- _Understanding the Forecast_, p. 25.
:::

## "Balance the Budget" {#budget_expl}

### \(\text{Heat}_{\text{in}} = \text{Heat}_{\text{out}}\)

* {+} Nature balances the budget automatically.
* {+} We use this fact to find the ground temperature.
* {+} If you know that \(\text{Heat}_{\text{in}} = \text{Heat}_{\text{out}}\), you can figure out the intensities you don't know.
* {+} If you know the intensity of heat going out of something, you know its temperature.

## 1-Layer Model Review  {#one_layer_review .center}

:::::: {.columns}
::: {.column .seventy style="width:1200px;"}

* When **shortwave radiation** hits surface:
  * Fraction $\alpha$ is _reflected_.
  * Fraction $1 - \alpha$ is _absorbed_.
* {+} When **longwave radiation** hits surface or layer of atmosphere:
  * 100% is _absorbed_.
* {+} When radiation is absorbed:
  * It transforms from **radiative energy** to  **thermal energy**.
  * It stops behaving like _radiation_.
  * It becomes _vibrations of the molecules_ in the dirt, water, or atmosphere.
* {+} Separately from radiation being absorbed:
  * **Thermal radiation** is emitted from hot objects.
* {+} Greenhouse effect _is not longwave radiation **reflecting** off atmosphere_
  * {+} **Longwave radiation** is absorbed by atmosphere
  * {+} **Radiation** changes into **thermal energy** in air molecules.
    * Air molecules get _hotter_.
  * {+} Later, **air molecules** give off **thermal radiation**
    * This radiation is _different_ to the radiation they absorbed.
    
:::
::: {.column style="width:700px;"}

![One-layer model](assets/images/ar03f04.png){width=600px}

:::
::::::

## 1-Layer Model in Brief  {#one_layer_brief .center}

:::::: {.columns}
::: {.column .eighty style="width:1200px;"}
### **Start at top:**

* {+} Balance heat budget at boundary to space.
  $$
  \frac{(1 - \alpha) I_{\text{solar}}}{4} = \epsilon\sigma T_{\text{atmos}}^4
  $$
  * {+} [Same as bare-rock model: 
    \(T_{\text{atmos}} = 
    254~K\).]{.darkgreentext}
  * {+} _skin temperature_
* {+} Balance budget at atmosphere:
  $$
  \begin{aligned}
    \Rule{0pt}{3ex}{0ex}\epsilon\sigma T_{\text{ground}}^4 &= 2\epsilon\sigma T_{\text{atmos}}^4\\
    T_{\text{ground}}^4 &= 2 T_{\text{atmos}}^4\\
    T_{\text{ground}} &= \sqrt[4]{2}\: T_{\text{atmos}}
  \end{aligned}
  $$
  * {+} **Ground temp**:
    \(T_{\text{ground}} = \sqrt[4]{2}\: T_{\text{skin}} = 302~K\).
:::
::: {.column style="width:700px;"}
![One-layer model](assets/images/ar03f04.png){width=600px}
:::
::::::

## 1-Layer Model: Heat Balance Details

:::::: {.columns}
::: {.column .eighty style="width:1200px;"}

* Numbers: 
  * $I_{\text{solar}} = 1350~W/m^2$
  * {+} $I_{\text{in}} = (1 - \alpha) I_{\text{solar}} / 4 = 236~W/m^2$
  * {+} $I_{\text{down,atm}} = I_{\text{up,atm}} = I_{\text{in}} = 236~W/m^2$
  * {+} $I_{\text{up,ground}} = 2 I_{\text{up,atm}} = 472~W/m^2$
* {+} Balance:
  * {+} Boundary to Space: 
    * $\text{in} = I_{\text{in}} = 236~W/m^2$,
    * $\text{out} = I_{\text{up,atm}} = 236~W/m^2$.
  * {+} Atmosphere Layer: 
    * $\text{in} = I_{\text{up,ground}} = 472~W/m^2$,
    * $\text{out} = I_{\text{up,atm}} + I_{\text{down,atm}} = 472~W/m^2$.
  * {+} Ground:
    * $\text{in} = I_{\text{in}} + I_{\text{down,atm}} = 472~W/m^2$,
    * $\text{out} = I_{\text{up,ground}} = 472~W/m^2$.

:::
::: {.column style="width:700px;"}

![One-layer model](assets/images/ar03f04.png){width=600px}

:::
::::::

# Greenhouse Gases {#ghg_section .center}



## Greenhouse Gases  {#ghg .eighty}

Layer model was too simple:

* Emissivity \(\varepsilon\), varies with wavelength 
* Temperature varies with altitude

![](assets/fig/load_iris_spectrum-1.png)


## Temperature in the Atmosphere {#temperature_profile.center .eighty}

![](assets/fig/temp_profile-1.png)

# Longwave Light in the Atmosphere {#radiative_diffusion .center}

:::::: {.columns}
::: {.column .eighty}
* {+} At wavelengths where gases in the atmosphere absorb longwave:
  * Atmosphere is opaque. 
  * Like fog
* {+} For light to get out to space, **there can't be too many absorbing molecules overhead**.
  * The stronger the absorption at that wavelength,
  * or the greater the concentration of the gas in the atmosphere,
  * **the higher up you have to go before the atmosphere overhead is no longer opaque**.
* {+} The troposphere gets colder the higher you go.
  * 6.5K (12&deg;F) cooler per kilometer altitude.
  * Colder air emits lower intensity.
:::
::: {.column}
![Figure 4.4 from _Understanding the Forecast_ ](assets/images/ar04f04.png){style="height:750px"}
:::
::::::

## Earth seen by GOES satellite {#GOES_all_channel}

![GOES satellite images](assets/images/geall.14240.1900.png){style="height:950px;"}

# Understanding Greenhouse Gases {.center}

## Molecular Structure {.eighty}

:::::: {.columns}
::: {.column style="vertical-align:middle;"}
![Modes of vibration in H~2~O](assets/images/ar04f01.jpg){height="300"}

![Modes of vibration in CO~2~](assets/images/ar04f02.jpg){height="500"}
:::
::: {.column}
* Single atoms & two-atom molecules with the same atom (O~2~, N~2~) 
  have little or no longwave absorption
* {+} Molecules with:
  * two different atoms (CO, NO) absorb (simple stretch)
  * {+} three or more atoms (CO~2~, O~3~, H~2~O) absorb strongly 
    (multiple stretching & bending modes)
  * {+} More atoms, more different kinds &rarr; stronger absorption 
    (CH~4~, C~2~F~3~Cl~3~ aka CFC 113)
:::
::::::

## Models and Observations {#models_observations_sec data-transition="fade"}

## Models and Observations {#models_observations data-transition="fade-in" data-backgorund-transition="fade"}
![](assets/fig/model.sahara-1.png)

Checking MODTRAN model: It looks very similar to real life.

# MODTRAN Computer Model {#modtran_section .center data-transition="fade-out"}

## What is MODTRAN? {#what_is_modtram data-transition="fade" .eightyfive}

> * Pure radiative calculation
>     * Air does not move:
>         * No wind or convection
> * Only calculates infrared heat flux
>     * Does not give equilibrium ground temperature
> * Only calculates one spot
>     * Does not give global averages
> * You specify:
>     * Ground temperature
>     * Composition of atmosphere
> * Modtran computes:
>     * Longwave radiation at different altitudes
>     * Total radiation to space

## Running MODTRAN {#running_modtran}

* Go to <http://climatemodels.uchicago.edu/modtran/>
* [Next](#double_co2)

<iframe src="https://climatemodels.jgilligan.org/modtran/" style="height:800px;width:1500px;">
[http://climatemodels.uchicago.edu/modtran/](http://climatemodels.uchicago.edu/modtran)
</iframe>


## Exercise: Double CO~2~ {#double_co2 .eighty}

:::::: {.columns .vtop}
::: {.column .vtop}
* Set Locality to "Tropical Atmosphere"
* Click "Save This Run to Background"
* Note the Upward IR heat flux
* Double the amount of CO~2~
* Adjust T offset until new heat flux = background flux
* What is the new ground temperature?
:::
::: {.column}
<iframe src="https://climatemodels.jgilligan.org/modtran/" style="height:750px;width:940px;"></iframe>
:::
::::::

## Exercise: Double CO~2~ {#double_co2_2}

<iframe src="https://climatemodels.jgilligan.org/modtran/" style="height:800px;width:1500px;"></iframe>

# Different Gases {#different_gas_sec .center}

## Different Gases {#different_gases}

<iframe src="https://climatemodels.jgilligan.org/modtran/" style="height:800px;width:1500px;"></iframe>

# Band Saturation {#band_saturation_intro_sec .center}

## Set up MODTRAN: {#setup_modtran .eighty}

* Set "Location" to "1976 U.S. Standard Atmosphere"
* Set All greenhouse gases to zero
* Set altitude to 20 km

<iframe src="https://climatemodels.jgilligan.org/modtran/" style="height:800px;width:1500px;"></iframe>

## No CO~2~ {#co2_00000 data-transition="fade-out"}
![](assets/fig/no.ghg-1.png)

## 1 ppm CO~2~ {#co2_00001 data-transition="fade"}
![](assets/fig/co2.00001-1.png)


## 2 ppm CO~2~ {#co2_00003_125 data-transition="fade"}
![](assets/fig/co2.00002-1.png)


## 4 ppm CO~2~ {#co2_00004 data-transition="fade"}
![](assets/fig/co2.00004-1.png)


## 8 ppm CO~2~ {#co2_00008 data-transition="fade"}
![](assets/fig/co2.00008-1.png)

## 16 ppm CO~2~ {#co2_00016 data-transition="fade"}
![](assets/fig/co2.00016-1.png)

## 32 ppm CO~2~ {#co2_00032 data-transition="fade"}
![](assets/fig/co2.00032-1.png)


## 64 ppm CO~2~ {#co2_00064 data-transition="fade"}
![](assets/fig/co2.00064-1.png)

## 128 ppm CO~2~ {#co2_00128 data-transition="fade"}
![](assets/fig/co2.00128-1.png)

## 256 ppm CO~2~ {#co2_00256 data-transition="fade"}
![](assets/fig/co2.00256-1.png)

## 512 ppm CO~2~ {#co2_00512 data-transition="fade"}
![](assets/fig/co2.00512-1.png)

## 1024 ppm CO~2~ {#co2_01024 data-transition="fade"}
![](assets/fig/co2.01024-1.png)

## 2048 ppm CO~2~ {#co2_02048 data-transition="fade-in"}
![](assets/fig/co2.02048-1.png)

# Measuring Band Saturation {#band_saturation_detect_sec .center}

## Set up MODTRAN: {#setup_modtran_2 .eighty}

* Go to MODTRAN, set CO~2~ to 0.25 ppm, and set all other gases to zero.

<!-- -->

> * Set altitude to 20 km and location to "1976 U.S. Standard Atmospheree".
> *  Press "Save this run to background"
> *  Note _I_~out~
> *  Double CO~2~ and note the change in _I_~out~
> *  Keep doubling CO~2~ until you get to 1024 ppm.
> *  Do you notice anything about the changes in _I_~out~?

## 0 ppm CO~2~ {#co2_delta_00000 data-transition="fade-out"}
![](assets/fig/co2.delta.00000-1.png)

## 0.25 ppm CO~2~ {#co2_delta_00000_25 data-transition="fade"}
![](assets/fig/co2.delta.00000_25-1.png)


## 0.5 ppm CO~2~ {#co2_delta_00000_5 data-transition="fade"}
![](assets/fig/co2.delta.00000_5-1.png)


## 1 ppm CO~2~ {#co2_delta_00001 data-transition="fade"}
![](assets/fig/co2.delta.00001-1.png)

## 2 ppm CO~2~ {#co2_delta_00003_125 data-transition="fade"}
![](assets/fig/co2.delta.00002-1.png)


## 4 ppm CO~2~ {#co2_delta_00004 data-transition="fade"}
![](assets/fig/co2.delta.00004-1.png)


## 8 ppm CO~2~ {#co2_delta_00008 data-transition="fade"}
![](assets/fig/co2.delta.00008-1.png)

## 16 ppm CO~2~ {#co2_delta_00016 data-transition="fade"}
![](assets/fig/co2.delta.00016-1.png)

## 32 ppm CO~2~ {#co2_delta_00032 data-transition="fade"}
![](assets/fig/co2.delta.00032-1.png)


## 64 ppm CO~2~ {#co2_delta_00064 data-transition="fade"}
![](assets/fig/co2.delta.00064-1.png)

## 128 ppm CO~2~ {#co2_delta_00128 data-transition="fade"}
![](assets/fig/co2.delta.00128-1.png)

## 256 ppm CO~2~ {#co2_delta_00256 data-transition="fade"}
![](assets/fig/co2.delta.00256-1.png)

## 512 ppm CO~2~ {#co2_delta_00512 data-transition="fade"}
![](assets/fig/co2.delta.00512-1.png)

## 1024 ppm CO~2~ {#co2_delta_01024 data-transition="fade"}
![](assets/fig/co2.delta.01024-1.png)

## 2048 ppm CO~2~ {#co2_delta_02048 data-transition="fade-in"}
![](assets/fig/co2.delta.02048-1.png)

## Band Saturation (I~out~) {#band_sat_i data-transition="fade-out"}
![](assets/fig/band.sat.i.out-1.png)

## I~out~ (CO~2~ on log scale) {#band_sat_i data-transition="fade"}
![](assets/fig/band.sat.i.out.log-1.png)

## $\Delta I_{\text{out}}$  {#band_sat_delta data-transition="fade"}
![](assets/fig/band.sat.delta.i-1.png)

Change in _I_~out~ from no CO~2~

## Increments of _I_~out~  {#band_sat_inc data-transition="fade-in"}
![](assets/fig/band.sat.inc-1.png)

Change in _I_~out~ from previous _I_~out~


# Measuring Greenhouse Effect: {#greenhouse_effect_sec .center }

## Measuring Greenhouse Effect: {#greenhouse_effect data-transition="fade-out"}

* Go to MODTRAN, set CO~2~ to 0 ppm, and set all other gases to zero.
* {+} Set altitude to 70 km and location to "Tropical Atmosphere".
* {+} Press "Save this run to background"
* {+} Note _I_~out~
* {+} Set CO~2~ to 400 ppm and note the change in _I_~out~
* {+} Adjust the temperature offset to make the difference in <br/>
  \(I_{\text{out}} (\text{New} - \text{BG})\) equal zero.

## No Greenhouse Gases {#greenhouse_effect_00 data-transition="fade"}
![](assets/fig/warming.000-1.png)

## 400 ppm  {#greenhouse_effect_400 data-transition="fade"}
![](assets/fig/warming.400-1.png)

## Adjust temperature  {#greenhouse_effect_400_warm data-transition="fade"}
![](assets/fig/warming.400.warm-1.png)

# Calculating Global Warming {#calc_warming_sec .center data-transition="fade"}

## Calculating Global Warming  {#calc_warming data-transition="fade"}

* "Climate sensitivity" = \(\Delta T_{2x}\)
  * Temperature rise for doubled CO~2~.
  * Uncertain (because of feedbacks)
  * Best estimate: $\Delta T_{2x} \sim$ 3.2K (range  2.0--4.5 K)
* {+} Every time you double CO~2~, \(T\) rises by \(\Delta T_{2x}\).
* {+} For arbitrary change in CO~2~:

  ::: {style="background-color:ghostwhite;margin:20px;border:10px;color:darkblue;"}
  $$\Delta T = \Delta T_{2x} \times 
  \frac{\ln\left(\frac{\text{new}~p\COO}{\text{old}~p\COO}\right)}{\ln 2}$$
  :::

## Global Warming Potential {#gwp}

* Absorption by CO~2~ and water vapor are very saturated
* {+} Absorption in the atmospheric window is not saturated
* {+} Therefore, molecule-for-molecule, gases that absorb in the window 
  have a much bigger effect on the climate than adding more CO~2~.
  * {+} One chlorofluorocarbon molecule = thousands of CO~2~ molecules
* {+} Global Warming Potential (GWP)  of _x_ = how many CO~2~ molecules 
  cause the same warming as one molecule of _x_
