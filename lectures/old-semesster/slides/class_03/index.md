---
title: "Energy Balance and Climate"
class_no: 3
class_date: "Friday, January 29"
qrimage: qrcode.png
pageurl: "ees3310.jgilligan.org/slides/class_03"
pdfurl: "ees3310.jgilligan.org/slides/class_03/ees_3310_5310_class_03_slides.pdf"
course: "EES 3310/5310"
course_name: "Global Climate Change"
author: "Jonathan Gilligan"
semester: Spring
year: 2021
output:
  revealjg::revealjs_presentation
---

## Looking for a Good Home {#goldilocks .yellowtitle .yellowtext data-background="black"}
<style>
.reveal .planettable td{
  text-align: center;
  vertical-align: middle;
  border: none;
  color: white;
}

.reveal .planetdiv {
  width:  600px;
  height: 500px;
}

.reveal .planetdiv p {
  height:100%;
}

.reveal .planetslug {
  display: inline-block;
  height: 100%;
  vertical-align: middle;
}

.reveal .planetimage {
  border: none;
  background: none;
  max-width: 100%;
  height: auto%;
  -moz-transform: scale(1.6);
  -ms-transform: scale(1.6);
  -webkit-transform: scale(1.6);
  transform: scale(1.6);
  vertical-align: middle;
}
</style>
<center style="position:relative;top:100px;">
<table class="planettable" style="border:none;text-align:center;vertical-align:middle;"><tr>
<td>
<div class="planetdiv">
<span class="planetslug"></span>
<img class="planetimage" src="assets/images/planetmars.png" />
</div>
</td>
<td>
<div class="planetdiv">
<span class="planetslug"></span>
<img class="planetimage" src="assets/images/planetearth.png" />
</div>
</td>
<td>
<div class="planetdiv">
<span class="planetslug"></span>
<img class="planetimage" src="assets/images/planetvenus.png" />
</div>
</td>
</tr><tr>
<td class="fragment fade-in" data-fragment-index="2"><p>Bad</p><p>
\(-28^\circ\mathrm{F}\)
</p></td>
<td class="fragment fade-in" data-fragment-index="1"><p>Good</p><p>
\(71^\circ\mathrm{F}\)
</p></td>
<td class="fragment fade-in" data-fragment-index="3"><p>Worst</p><p>
\(800^\circ\mathrm{F}\)
</p></td>
</tr></table>
</center>

# Basic Concepts {#basic_concepts .center}

## Vocabulary {#vocab .leftslide}

* {+} **Energy, Heat:**
  * {+} Heat = energy flowing spontaneously from hot to cold
* {+} **Power:** speed at which energy flows or transforms 

  $$ \text{Power, Flux} = \text{Heat flow} / \text{Time} $$ 
  $$ \text{Heat, Energy} = \text{Power} \times \text{Time} $$

* {+} **Intensity:** Concentration of power 

  $$ \text{Intensity} = \text{Power} / \text{Area} $$ 
  $$ \text{Power} = \text{Intensity} \times \text{Area} $$

## Temperature of a planet

* **Basic principle:**

  Steady temperature if and only if
  $$ \text{Power}_{\text{in}} = \text{Power}_{\text{out}} $$

* **How can heat get in or out?**
  * {+} Electromagnetic radiation

## Electromagnetic Waves {#em_waves .center data-transition="fade" background-transition="fade"}

* **Color** and **brightness**
  * **Color:**
    * Two ways to measure **color**:
    * Wavelength (\(\lambda\))
    * Wavenumber (\(n = 1/\lambda\))
  * {+} Archer mostly uses wavenumber
    * Math is simpler that way
  * {+} **Brightness:**
    * Intensity (power/area, Watts/square meter)

## Colors {#colors .ninety}

![color spectrum](assets/images/colortable.png)

### All you need to think about is <br/> **shortwave** vs. **longwave** radiation.

## **Shortwave** and **longwave**: {#shortwave_longwave}

* **Shortwave**:
  * Near-infrared, visible, ultraviolet
  * \(\lambda < 3 \mu\mathrm{m}\)
  * \(n > 3,300 \text{cm}^{-1}\) (cycles per centimeter)
* **Longwave**:
  * Mid-infrared, far-infrared
  * \(\lambda > 3 \mu\mathrm{m}\)
  * \(n < 3,300 \text{cm}^{-1}\)

More on this on Monday ...

::: notes

Before going on to the next slide, show the demo with the space heater and
variac.

:::

## 4 Laws of Radiation {#radiation_laws}

#. {+} All objects continually radiate energy
#. {+} Hotter objects are brighter
#. {+} Hotter objects radiate at shorter wavelengths
#. {+} Objects that are good absorbers are also good emitters
   * {+} Black objects emit & absorb the most
   * {+} Transparent and white objects emit & absorb the least

## Example of Radiant Heat {#radiant-heat}

::::::{.columns}
:::{.column .bare}
![Photo of my pet dog Finley](assets/images/finley_vis.jpg){style="height:475px;"}

![Infrared photo of my pet dog Finley](assets/images/finley_ir.jpg){style="height:475px;"}

:::
:::{.column .ptop-2}

* Featuring my dog, Finley.
* {+} All objects emit electromagnetic radiation
* {+} Hotter objects emit
  * More intense the radiation
  * Shorter wavelengths
:::
::::::


# Blackbody Radiation  {#blackbody_sec .center}

## Blackbody Radiation  {#blackbody .leftslide data-transition="fade" data-background-transition="fade"}

**Emissivity** (\(\varepsilon\)) measures how black something is:

* {+} \(\varepsilon = 1\) for perfectly black
* {+} \(\varepsilon = 0\) for perfectly white or transparent
* {+} In between for gray.
* {+} Black, white, and gray: \(\varepsilon\) is the same for all wavelengths.
* {+} Colored objects: \(\varepsilon\) is different for different wavelengths.
* {+} **For simplicity:** start by assuming everything is black, white, or gray.

. . . 

**Remember:** Good emitters are good absorbers

. . .

**Fundamental rule:** Temperature and emissivity determine radiation.


## Heating Up: What Changes?? {#temperature_dependence}
![](assets/fig/blackbody_spectrum-1.png)

## Heating Up: What Changes? {#blackbody_details .leftslide}

* Hotter temperature:
  * Brighter (greater intensity)
  * Bluer (greater wavenumber, shorter wavelength)

::::::::: {.columns}
:::::: {.column .fragment .fade-in .ptop-2-em}

A curious thing:

* A hot black object glows with color!

<!-- -->

::: {style="color:darkblue;border:5px;border-style:solid;border-color:darkblue;text-align:center;position:relative;top:25px;"}

**Total intensity = <br/>area under curve**

:::
::::::
:::::: {.column}



<img src="assets/fig/plot_small_blackbody-1.png"/>

::::::
:::::::::


# Mathematical Description  {#mathematical_description .center}

## Blackbody Radiation {#blackbody_math .leftslide .eightyfive}

:::::: {.columns}
::: {.column}
Intensity (brightness):

Stefan-Boltzmann law
$$ I = \varepsilon \sigma T^4 $$
after Josef Stefan<br/>and Ludwig Boltzmann

* \(\varepsilon\) =  emissivity
  * Different for different objects. 
* \(\sigma\) =  Stefan-Boltzmann constant.
* \(T\) = absolute (Kelvin) temperature.
:::
::: {.column}

<img src="assets/fig/plot_small_blackbody-1.png" width="1000px"/>
:::
::::::

**Color:** Peak wavenumber proportional to (Kelvin) temperature.

<div class="fragment fade-in" style="border:1px; border-color:darkblue; border-style:solid; background-color:yellow; text-align:left; position:relative; bottom=10px;">
<b>Helpful Hint:</b><br/>
Fourth power on a calculator:
press the \(x^2\) button twice.
</div>

-------

## Sun and Earth  {#SunAndEarth .noborder .ninety data-background-image="assets/images/solar_earth_spectra.jpg" data-background-size="contain" data-transition="fade" background-transition="fade"}

::: {style="position:absolute;top:150px;right:310px;background-color:#ECF7ED;font-weight:bold;border:2px;border-style:solid;border-color:black;"}

| | |
|:------|------:|
| **Longwave (\(\lambda > 3~\text{micron}\))** | **2%** |
| **Visible & Near-IR (\(0.4 < \lambda < 3~\text{micron}\))** | **91%** |
| **Ultraviolet (\(\lambda < 0.4~\text{micron}\))** | **7%** |
| **Total Shortwave (UV + Vis + Near-IR)** | **98%** |

:::

## Earth and Radiation

[![Earth as seen from space by the NASA CERES experiment, showing longwave thermal radiation and shortwave reflected sunlight](assets/images/BoxcarPair720x404-1024x574.jpg){style="height:700px;"}]{.bare}

False-color images of radiation from Earth, seen by NASA Terra satellite:

* Left: Thermal radiation (blue &rarr; red &rarr; yellow = dim &rarr; bright)
* Right: Reflected sunlight (blue &rarr; green &rarr; white = dim &rarr; bright)

## Efficiency of Light Bulbs {#lightbulb}

<table class="noborder ninety"><tr><th>Type of Bulb</th><th>Efficiency</th></tr><tr><td>Standard 40W</td><td>1.8%</td></tr><tr><td>Standard 60W</td><td>2.1%</td></tr><tr><td>Standard 100W</td><td>2.6%</td></tr><tr><td>Quartz Halogen</td><td>3.5%</td></tr><tr><td>Ideal black body @ 7000K</td><td>14.0%</td></tr><tr><td>Compact Fluorescent</td><td>8--12%</td></tr><tr><td>LED</td><td>20--44%</td></tr></table>

::: {.eighty}
* 7000K is the optimal temperature for a black body to emit visible light, 
  but it will melt every known substance.
* Standard light bulbs operate at around 2000--3300 K.
:::

# Calculating Earth's Temperature: <br/>Bare-Rock Model {#bare_rock_earth .center}

## Basics {#bare_rock_basics .ninety .leftslide}

### Steady Temperature

* Heat in must balance heat out
* \(\text{Total Heat Flux (Power)} = \text{Area} \times \text{Intensity}\)
  * Total heat flux in (\(F_{\text{in}}\)):
    * Intensity depends on solar constant and albedo
    * Does not depend on earth's temperature
  * Total heat flux out (\(F_{\text{out}}\)):
    * Intensity depends on earth's temperature and emissivity
* Strategy:
  1. Figure out \(F_{\text{in}}\).
  2. Figure out temperature \(T\) that makes \(F_{\text{out}} = F_{\text{in}}\).

## Solar Constant and <br/>Inverse Square Law {#solar_constant .ninety .yellowtitle data-background="assets/images/inverse_square.png"}

::: { .vbot .eighty style="position:fixed;bottom:30px;left:20%;color:yellow;background-color:rgba(33,70,39,0.5);"}

* Total flux (power) radiated from sun doesn't change with distance.
* At a distance \(r\) total flux spreads over sphere of radius \(r\)
* Intensity = Total Flux / Area: 
  * Proportional to \(1/r^2\).
* At edge of Earth's atmosphere, solar intensity = \(1350~\mathrm{W}/\mathrm{m}^2\).
:::

## What is \(F_{\text{in}}\)? {#f_in .ninety}

* \(F_{\text{in}} = \text{Area} \times \text{Intensity absorbed}\)
    * \(\text{Intensity absorbed} = (1 - \alpha) \times I_{\text{in}}\)
        * \(I_{\text{in}} = 1350~\mathrm{W}/\mathrm{m}^2\)
        * Average albedo \(\alpha = 0.30\) (30% of sunlight is reflected)

:::::: {.columns}
::: {.column .vmid .fragment data-fragment-index="1" style="font-size:130%;"}
### What is area?

* {+ 2} Area = silhouette or shadow
* {+ 3} Circle: \(\pi r^2\)
:::
::: {.column .fragment data-fragment-index="2"}
![silhouette](assets/images/sunlight_on_earth.png)
:::
::::::

::: notes

This is a good time to show a demo of the shadow cast by a ball

:::

## What is \(F_{\text{in}}\)? {#f_in2 .ninety}

* \(F_{\text{in}} = \pi r_{\text{Earth}}^2 \times (1 - \alpha) I_{\text{in}} \)
  * \(\pi r^2 = 1.3 \times 10^{14} \mathrm{m}^2\)
  * \(\alpha = 0.30\)
    * \((1 - \alpha) = 0.70\)
  * \(I_{\text{in}} = 1350~\mathrm{W}/\mathrm{m}^2\)
* \(F_{\text{in}} = 
  1.3 \times 10^{14}~\mathrm{m}^2 \times 
    0.70 \times 
    1350~\mathrm{W}/\mathrm{m}^2\) <br>
    \(\phantom{F_{\text{in}}} = 
  1.2 \times 10^{17}
  \text{Watts}\)
  * 11,000 times total human energy production.

## What is \(F_{\text{out}}\)? {#f_out .ninety}

:::::: {.columns}
::: {.column style="font-size:120%;"}
* {+ 1} \(F_{\text{out}} = \text{Area} \times I_{\text{out}} \)
  * {+ 2} \(I_{\text{out}} = \varepsilon \sigma T^4 \)
    * \(\varepsilon = 1\) (blackbody)
    * \(\sigma = 5.67 \times 10^{-8}~\mathrm{W}/\mathrm{m}^2/\mathrm{K}^4\)
  * {+ 3} What is area?
    * {+ 4} Sphere: \(4 \pi r^2\)
  * {+ 5} \(F_{\text{out}} = 4 \pi r_{\text{earth}}^2 \times \varepsilon \sigma T^4\)
:::
::: {.column .fragment data-fragment-index="4"}
![area for emissions](assets/images/earthglow.png)
:::
::::::

## Putting it all together {#f_balance_earth}

<style>
#f_balance_earth {
line-height: 2;
}
</style>

:::::: {.centertext }
::: {.fragment}
\[F_{\text{out}} = F_{\text{in}}\]
:::
::: {.fragment} 
\[4 \pi r^2 \times \varepsilon \sigma T^4 = \pi r^2 (1 - \alpha) I_{\text{in}}\]
:::
::: {.fragment}
\[4 {\color{red}{\pi r^2}} \times \varepsilon \sigma T^4 = {\color{red}{\pi r^2}} (1 - \alpha) I_{\text{in}}\]
:::
::: {.fragment}
\[4 \varepsilon \sigma T^4 = (1 - \alpha) I_{\text{in}}\\\]
:::
::: {.fragment}
\[T^4 = \frac{(1 - \alpha) I_{\text{in}}}{4 \varepsilon \sigma}\\\]
:::
::: {.fragment}
\[T = \sqrt[4]{\frac{(1 - \alpha) I_{\text{in}}}{4 \varepsilon \sigma}}\]
:::
::::::

# Temperature of Earth {#t-earth-sec .center}

## Temperature of Earth {#t_earth .ninety}

<style>
#t_earth {
line-height:1.8;
}
</style>

* Steady Temperature:
  * Heat flux in must balance heat flux out (\(F_{\text{out}} = F_{\text{in}}\)).
  * \(F_{\text{in}}\):
    * Does not depend on earth's temperature.
    * Depends on solar constant and earth's albedo.
  * \(F_{\text{out}}\):
    * Depends on earth's temperature.
  * \(T\) adjusts until heat out = heat in.
$$ T = \sqrt[4]{\frac{(1 - \alpha) I_{\text{in}}}{4\varepsilon\sigma}} $$

:::::: {.fragment .fade-in}
::: {.fragment .fade-out .vbot style="width:50%; border:5px; border-style:solid; border-color:darkblue; background-color:yellow; position:relative; left:650px; bottom:500px;"}
**Helpful hint:**

To take the fourth root on a calculator, press the square-root key (\(\scriptstyle\sqrt{}\)) twice
:::
::::::

## Temperature of Earth {#t_earth2 .ninety}

$$ T = \sqrt[4]{\frac{(1 - \alpha) I_{\text{in}}}{4\varepsilon\sigma}} $$

### **Earth:** {style="margin-top:50px;"}

(Note: My numbers are slightly different from Archer's textbook)

* \(I_{\text{in}} = 1350~\mathrm{W}/\mathrm{m}^2\)
* \(\alpha = 0.30\)
* \(\varepsilon = 1\)
* \(\sigma = 5.67 \times 10^{-8}~\mathrm{W}/(\mathrm{m}^2\mathrm{K}^4)\)
* Calculate \(T\):
* {+} $T = 254~\mathrm{K} = -19^\circ\mathrm{C} = 
-2^\circ\mathrm{F}$.

<!--- #brighter_sun ---> {#brighter_sun}
------



### If the sun got 5% brighter, <br/> how much warmer would the earth become?

$$ T = \sqrt[4]{\frac{(1 - \alpha) I_{\text{in}}}{4 \varepsilon \sigma}}\\$$

* {+} Normal: \(I_{\text{in}} = 1350~\mathrm{W}/\mathrm{m}^2\): 
  * {+} \(T = 254~\mathrm{K}\)
* {+} 5% Brighter: 
  \(I_{\text{in}} = 1.05 \times 1350~\mathrm{W}/\mathrm{m}^2 = 1418~\mathrm{W}/\mathrm{m}^2\): 
  * {+} \(T = 257~\mathrm{K}\)
* {+} \(\Delta T = 3~\mathrm{K} = 6^\circ\mathrm{F}\)

## Temperature of Earth {#t_earth3 .ninety}

$$ T = \sqrt[4]{\frac{(1 - \alpha) I_{\text{in}}}{4\varepsilon\sigma}} $$

### Earth:

(Note: My numbers are slightly different from Archer's textbook)

* \(I_{\text{in}} = 1350~\mathrm{W}/\mathrm{m}^2\)
* \(\alpha = 0.30\)
* \(\varepsilon = 1\)
* \(\sigma = 5.67 \times 10^{-8}~\mathrm{W}/(\mathrm{m}^2\mathrm{K}^4)\)
* $T = 254~\mathrm{K} = -19^\circ\mathrm{C} = 
-2^\circ\mathrm{F}$.

::: {.fragment .fade-in style="position:relative; top:50px; background-color:yellow; border:2px; border-style:solid; border-color:darkblue;"}
### How does this compare to Earth's actual temperature?
:::

# Comparing Theory and Observation {#theory-vs-obs .center}

## Radiative Temperature {#rad_temp .ninety}

* Satellites orbiting in space can measure longwave radiation from earth
* To the satellites, the earth looks very much like a blackbody at the bare-rock 
  temperature (254&nbsp;K).

* Thus, scientists generally call the bare-rock temperature the **radiative temperature** because
  it describes the radiation coming off the earth.
* {+} However, the surface temperature of the earth is around 
  $295~\mathrm{K} 
  = 71^\circ\mathrm{F}$,
  which is significantly different from the radiative, or bare-rock, 
  temperature.  

# Terrestrial Planets {#terrestrial-planet-sec .yellowtitle .center data-background="black"}

## The Terrestrial Planets {#terrestrial_planets .yellowtitle .yellowtext data-background="black"}

<center style="position:relative;top:100px;">
<table class="planettable" style="border:none;text-align:center;vertical-align:middle;"><tr>
<td>
<div class="planetdiv">
<span class="planetslug"></span>
<img class="planetimage" src="assets/images/planetmars.png" />
</div>
</td>
<td>
<div class="planetdiv">
<span class="planetslug"></span>
<img class="planetimage" src="assets/images/planetearth.png" />
</div>
</td>
<td>
<div class="planetdiv">
<span class="planetslug"></span>
<img class="planetimage" src="assets/images/planetvenus.png" />
</div>
</td>
</tr><tr>
<td><p>Mars</p><p>
\(240~\mathrm{K}\)
</p></td>
<td><p>Earth</p><p>
\(295~\mathrm{K}\)
</p></td>
<td><p>Venus</p><p>
\(700~\mathrm{K}\)
</p></td>
</tr></table>
</center>



## Terrestrial Planets {#terrestrial_planet_temp}


|                         |        Earth              |     Mars                    |       Venus                   |
|:-----------------------:|:-------------------------:|:---------------------------:|:-----------------------------:|
| Distance from sun       |             1 AU          |             1.5 AU          |       0.72 AU                 |
| \(1 / \text{Distance}^2\) |       1.00                |             0.44            |       1.9                     |
| Solar constant          |  \(1350~\mathrm{W}/\mathrm{m}^2\)  |  \(600~\mathrm{W}/\mathrm{m}^2\)     |  \(2604~\mathrm{W}/\mathrm{m}^2\)      |
| Albedo                  | 0.30          |  0.17            |  0.71             |
| \(T_{\text{bare rock}}\)  |  \(254~\mathrm{K}~( -2^\circ\mathrm{F})\)   |  \(216~\mathrm{K}~( -70^\circ\mathrm{F})\)      |  \(240~\mathrm{K}~( -27^\circ\mathrm{F})\)       |
| \(T_{\text{surface}}\)    |  \(295~\mathrm{K}~( 71^\circ\mathrm{F})\)      |  \(240~\mathrm{K}~( -28^\circ\mathrm{F})\)   |  \(700~\mathrm{K}~( 800^\circ\mathrm{F})\)    |
| \(\Delta_T\)    |  \(41~\mathrm{K}~( 74^\circ\mathrm{F})\) |  \(24~\mathrm{K}~( 42^\circ\mathrm{F})\)   |  \(460~\mathrm{K}~( 828^\circ\mathrm{F})\)    |
