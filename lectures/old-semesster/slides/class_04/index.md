---
title: "Introducing the Greenhouse Effect"
class_no: 4
class_date: "Monday, Feb. 1"
qrimage: qrcode.png
pageurl: "ees3310.jgilligan.org/slides/class_04"
pdfurl: "ees3310.jgilligan.org/slides/class_04/ees_3310_5310_class_04_slides.pdf"
course: "EES 3310/5310"
course_name: "Global Climate Change"
author: "Jonathan Gilligan"
semester: Spring
year: 2021
output:
  revealjg::revealjs_presentation
---

## Basic Principles from Friday {#basic-principles .leftslide}
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


* **Steady temperature means:**
  * $\text{Heat}_{\text{out}} = \text{Heat}_{\text{in}}$
* {+} **Heat in:**
  * Sunlight (**[shortwave]{.darkbluetext}**)
  * Does not depend on temperature
* {+} **Heat out:**
  * Emitted radiation (**[longwave]{.darkredtext}**)
  * Depends on temperature
* {+} If $\text{Heat}_{\text{out}} \neq \text{Heat}_{\text{in}}$,
  * Temperature rises or falls until 
    $$\text{Heat}_{\text{out}} = \text{Heat}_{\text{in}}$$
    
# Temperature of the Earth {#layer-model-sec .center}

## Bare-Rock Model: No Atmosphere  {#bare-rock .center}

![Bare-Rock Model](assets/images/ar03f03.png){style="height:900px;"}

## A subtle point... {#subtle-point .eightyfive data-transition="fade"}

::::::::: {.columns}
:::::: {.column .vtop}
* Emissivity $\varepsilon$ is fraction absorbed
* Albedo $\alpha$ is fraction reflected
* For an opaque surface, $\alpha + \varepsilon = 1$
* So how is $\alpha = 0.30$ 
and $\varepsilon = 1.00$?

* {+ 1} <span style="color:darkgreen;">\(\alpha\) & \(\varepsilon\) are 
  different for shortwave & longwave.
* {+ 1} <span style="color:darkred"> Shortwave:
  \(\alpha = 0.30\), 
  \(\varepsilon = 0.70\)</span>
* {+ 1} <span style="color:darkblue"> Longwave:
  \(\alpha = 0.00\), 
  \(\varepsilon = 1.00\)</span>
::::::
:::::: {.column .vtop}
![Bare-Rock Model](assets/images/ar03f03small.png){style="height:500px;"}
::::::
:::::::::

## Temperature of Earth (Bare Rock Model) {#bare-rock-temp .ninety}

#. $F_{\text{out}} = F_{\text{in}}$ (Heat flux balances)
#. On average, 
   $$F_{\text{in}} = \frac{(1 - \alpha)}{4} I_{\text{solar}}$$
#. $F_{\text{out}} = \varepsilon \sigma T^4$.
#. Solve for $T$:

   :::::: {.columns .mtop-2}
   ::: {.column .vtop}
   $$\large T = \sqrt[4]{\frac{(1-\alpha) I_{\text{solar}}}{4 \varepsilon \sigma }}$$
   :::
   ::: {.column .vtop .ninety}
   \[
   \begin{align*}
   I_{\text{solar}} &= 1350~\mathrm{W/m^2}\\
   \alpha &= 0.30\\
   \varepsilon &= 1\\
   \sigma &= 5.67 \times 10^{-8}\, \mathrm{W\,  m^{-2}\, K^{-4}}\\
   T &= 254~\mathrm{K} = -19\degC
     = -2\degF
   \end{align*}
   \]
   :::
   ::::::

## Terrestrial Planets {#terrestrial-planet-temp}


|                         |        Earth              |     Mars                    |       Venus                   |
|:-----------------------:|:-------------------------:|:---------------------------:|:-----------------------------:|
| Distance from sun       |             1 AU          |             1.5 AU          |       0.72 AU                 |
| \(1 / \text{Distance}^2\) |       1.00                |             0.44            |       1.9                     |
| Solar constant          |  \(1350~\mathrm{W}/\mathrm{m}^2\)  |  \(600~\mathrm{W}/\mathrm{m}^2\)     |  \(2604~\mathrm{W}/\mathrm{m}^2\)      |
| Albedo                  | 0.30          |  0.17            |  0.71             |
| \(T_{\text{bare rock}}\)  |  \(254~\mathrm{K}~( -2^\circ\mathrm{F})\)   |  \(216~\mathrm{K}~( -70^\circ\mathrm{F})\)      |  \(240~\mathrm{K}~( -27^\circ\mathrm{F})\)       |
| \(T_{\text{surface}}\)    |  \(295~\mathrm{K}~( 71^\circ\mathrm{F})\)      |  \(240~\mathrm{K}~( -28^\circ\mathrm{F})\)   |  \(700~\mathrm{K}~( 800^\circ\mathrm{F})\)    |
| \(\Delta_T\)    |  \(41~\mathrm{K}~( 74^\circ\mathrm{F})\) |  \(24~\mathrm{K}~( 42^\circ\mathrm{F})\)   |  \(460~\mathrm{K}~( 828^\circ\mathrm{F})\)    |

## Oops! We forgot the atmosphere! {#nimbus-spectrum data-background-transition="fade" data-transition="fade"}


![](assets/fig/bare_iris_spectrum-1.png)


## Does Earth look like a blackbody?   {#nimbus-blackbody data-transition="fade" data-background_transition="fade"}

![](assets/fig/iris_blackbody-1.png)


# One-Layer Model of the Greenhouse Effect {#layer-model-sec .center}

## Layer Model {#one-layer-model}

![Layer Model](assets/images/ar03f04.png){style="height:900px;"}


## Sunlight    {#sunlight .noborder .ninety data-background-transtion="slide" data-transition="slide" data-background-image="assets/images/solarearthspectra.jpg" data-background-size="100% 100%"}

<div style="position:absolute;top:150px;right:50px;background-color:#ECF7ED;font-weight:bold;border:2px;border-style:solid;border-color:black;">
<table>
<tr><td><b>
Longwave (>3 micron, < 3300/cm)
</b></td><td><b>
2%
</b></td></tr>
<tr><td><b>
Shortwave (UV + Vis + Near-IR)
</b></td><td><b>
98%
</table>
</div>



## Atmosphere  {#atmosphere}

### Make **simplifying assumptions**:

* Perfectly **[transparent]{.darkbluetext}** to **[shortwave]{.darkbluetext}** 
  light
  * Like a pane of glass: $\varepsilon = 0$
    
* Perfectly **[opaque]{.darkredtext}** to **[longwave]{.darkredtext}** 
  light
  * Like a blackbody: $\varepsilon = 1$

::: {.darkbluetext .centercol .yellowbox .mtop-1 style="width:800px;padding:10px;"}

**Anything that<br/>transmits most shortwave<br/>and<br/>absorbs most longwave<br/>is a greenhouse gas**

:::

## Balance of energy for earth system  {#energy-balance .leftslide .seventy .noborder data-transition="fade"}


::::::::: {.columns}
:::::: {.column .vtop style="width:67%;"}
* Always start analyzing from the top down
  * Look at energy balance at the boundary to space, above the top of the 
    atmosphere.
::::::
:::::: {.column style="width:400px;"}
![Layer Model](assets/images/ar03f04.png){style="height:525px;"}
::::::
:::::::::


## Balance of energy for earth system  {#energy-balance-2 .leftslide .seventy .noborder data-transition="fade"}

::::::::: {.columns}
:::::: {.column .vtop style="width:67%;"}

* {+} At top of atmosphere:
  \(F_{\text{out}} = F_{\text{in}}\)
  
  ::: {.fragment}
  \[
  \begin{align*}
  I_{\text{up, atmos}} &= I_{\text{in}}\quad \small{\text{(intensity of absorbed sunlight)}}\\
  \varepsilon \sigma T_{\text{atmos}}^4 &= \frac{(1 - \alpha) I_{\text{solar}}}{4}
  \end{align*}
  \]
  :::
* {+} Aha! We can find \(T_{\text{atmos}}\)!

  ::: {.fragment}
  \[
  T_{\text{atmos}} = \sqrt[4]{\frac{(1-\alpha)\,I_{\text{solar}}} {4\varepsilon\sigma}}
  \]
  :::

::::::
:::::: {.column style="width:400px;"}
![layer model fig. 1](assets/images/layer_model_1.png)
::::::
:::::::::

::: notes
Remind the students that the factor of 4 is because the sunlight is absorbed 
over an area of the earth's shadow or silhouette, but longwave heat is radiated
uniformly from the entire sphere.
:::

## Balance of energy for earth system  {#energy-balance-3 .leftslide .ninety data-transition="fade"}

:::::: {.columns}
::: {.column .vtop style="width:67%;"}

$$\large T_{\text{atmos}} = \sqrt[4]{\frac{(1-\alpha)\,I_{\text{solar}}}
    {4\varepsilon\sigma}}$$
    
* Just like bare rock model!
* We call this the <span style="color:blue"><b>skin temperature</b></span>

:::
::: {.column style="width:400px;"}

![layer model fig. 1](assets/images/layer_model_1.png)

:::
::::::


## Balance of energy for atmosphere  {#energy-balance-4 .leftslide .ninety data-transition="fade"}


:::::: {.columns}
::: {.column style="width:67%;vertical-align:top;"}

Atmosphere: \(\text{Heat}_{\text{in}} = \text{Heat}_{\text{out}}\)

\[
\begin{align*}
\color{red}{I_{\text{up,ground}}} &=
\color{blue}{I_{\text{up,atm}}} + \color{darkgreen}{I_{\text{down,atm}}}\\
\end{align*}
\]

:::
::: {.column style="width:400px;"}

![layer model fig. 2](assets/images/layer_model_2.png)

:::
::::::


## Balance of energy for atmosphere  {#energy-balance-5 .leftslide .ninety data-transition="fade"}

:::::: {.columns}
::: {.column style="width:67%;vertical-align:top;"}

Atmosphere: heat in = heat out.

\[
\begin{align*}
\color{red}{I_{\text{up,ground}}} &=
\color{blue}{I_{\text{up,atm}}} + \color{darkgreen}{I_{\text{down,atm}}}\\
\color{blue}{I_{\text{up,atm}}} &= \color{darkgreen}{I_{\text{down,atm}}} 
= \varepsilon \sigma \color{darkcyan}{T^4_{\text{atm}}}\\
\end{align*}
\]

:::
::: {.column style="width:400px;"}

![layer model fig. 2](assets/images/layer_model_2.png)

:::
::::::

::: notes 
Remind students that the idea of a layer model is that the layer of the 
atmosphere has uniform temperature from bottom to top.
:::

## Balance of energy for atmosphere  {#energy-balance-6 .leftslide .ninety data-transition="fade"}

:::::: {.columns}
::: {.column style="width:67%;vertical-align:top;"}

Atmosphere: heat in = heat out.

\[
\begin{align*}
\color{red}{I_{\text{up,ground}}} &=
\color{blue}{I_{\text{up,atm}}} + \color{darkgreen}{I_{\text{down,atm}}}\\
\color{blue}{I_{\text{up,atm}}} &= \color{darkgreen}{I_{\text{down,atm}}} 
= \varepsilon \sigma \color{darkcyan}{T^4_{\text{atm}}}\\
\color{red}{I_{\text{up,ground}}} &= \varepsilon \sigma \color{red}{T^4_{\text{ground}}}\\
\end{align*}
\]

:::
::: {.column style="width:400px;"}

![layer model fig. 2](assets/images/layer_model_2.png)

:::
::::::

## Balance of energy for atmosphere  {#energy-balance-7 .leftslide .ninety data-transition="fade"}

::::::::: {.columns}
:::::: {.column style="width:67%;vertical-align:top;"}

Atmosphere: heat in = heat out.

\[
\begin{align*}
\color{red}{I_{\text{up,ground}}} &=
\color{blue}{I_{\text{up,atm}}} + \color{darkgreen}{I_{\text{down,atm}}}\\
\color{blue}{I_{\text{up,atm}}} &= \color{darkgreen}{I_{\text{down,atm}}} 
= \varepsilon \sigma \color{darkcyan}{T^4_{\text{atm}}}\\
\color{red}{I_{\text{up,ground}}} &= \varepsilon \sigma \color{red}{T^4_{\text{ground}}}\\
\varepsilon \sigma \color{red}{T^4_{\text{ground}}} &= 2 \varepsilon \sigma \color{darkcyan}{T^4_{\text{atm}}}\\
\end{align*}
\]

:::  {.fragment style="font-size:80%;"}

**Principles:**

* {+} Start at the top.
* {+} For each layer, $\text{Heat}_{\text{out, up}} = \text{Heat}_{\text{out, down}}$
* {+} Each layer balances $\text{Heat}_{\text{in, total}} = \text{Heat}_{\text{out, total}}$
  * Each layer has uniform temperature: 
    * The [top]{style="color:darkblue;"} and [bottom]{style="color:darkgreen;"}
      of the layer have the same temperature.
    * So the intensity emitted from the [top]{style="color:darkblue;"} and 
      [bottom]{style="color:darkgreen;"} is the same.
* {+} The bottom layer of the atmosphere tells us $\text{Heat}_{\text{up, ground}}$
* {+} Get ground temperature from $\text{Heat}_{\text{up, ground}}$

:::
::::::
:::::: {.column style="width:400px;"}

![layer model fig. 2](assets/images/layer_model_2.png)

::::::
:::::::::

## Finish the problem {#finish-problem .leftslide .ninety data-transition="fade"}

:::::: {.columns .vtop}
::: {.column .vtop style="width:67%;"}

$$
\begin{align}
\varepsilon \sigma \color{red}{T_{\text{ground}}^4}
&=  2 \varepsilon \sigma \color{darkcyan}{T_{\text{atm}}^4}\\
\color{red}{T_{\text{ground}}^4}
&=  2 \color{darkcyan}{T_{\text{atm}}^4}\\
\color{red}{T_{\text{ground}}}
&=  \sqrt[4]{2}\, \color{darkcyan}{T_{\text{atm}}}\\
&=  1.19 \color{darkcyan}{T_{\text{atm}}}
\end{align}
$$


* {+} Skin temp: 
  ${\color{darkcyan}T_{\text{atm}}} = {\color{darkcyan}T_{\text{skin}}} = {\color{darkcyan}T_{\text{bare rock}}} = {\color{darkcyan}254~K}$
* {+} Ground temp (1-layer): 
  ${\color{red}T_{\text{ground}}} = \sqrt[4]{2} {\color{darkcyan}T_{\text{atm}}} = {\color{red}302~K}$
* {+} Difference: 
  $\text{Greenhouse effect} = 48~K$

<!-- terminate list -->

[**Note: These numbers are slightly different from what's in the book. 
Don't worry about that.**]{.fragment .fade-in}

:::
::: {.column style="width:400px;"}

![layer model fig. 2](assets/images/layer_model_2.png)

:::
::::::
 


# Greenhouse Gases {#greenhouse-gas-sec .center}


## Greenhouse Gases {#greenhouse-gases}

![greenhouse gas spectra](assets/images/ghg_spectra_large.png)


## Greenhouse Gases {#greenhouse-gases-2 .ninety}

:::::: {.columns}
::: {.column .bare style="width:49%;text-align:right;margin-top:1em;margin-bottom:0.5em;"}
![greenhouse gas spectra](assets/images/ghg_spectra_small.png){style="transform:scale(1.25,1.25);"}
:::
::: {.column style="width:50%;vertical-align:top;"}

* Brightness: Stefan-Boltzmann law:
  * \(I = \varepsilon \sigma T^4\)
  * \(\varepsilon = 1\)

:::
::::::

* Brighter = Hotter
* Hotter = closer to ground
  * Satellite can see through atmosphere to low altitude <br/> 
    (hot, bright) in "window" region.
  * Satellite can see to middle-troposphere (cold, dimmer) <br/> 
    in "water vapor" region
  * Satellite can't see past top of troposphere (very cold, very dim) <br/>
    in $\COO$ region.

# Earth Seen by Satellites {#earth-from-space-sec .center}

## Visible {#vis-satellite .ninety data-transition="fade-out"}

![Visible Satellite](assets/images/geos_vis.jpg){style="height:900px;"}

## $6.8~\mu\mathrm{m}$ (Water Vapor) {#satellite-water-vapor .ninety .noborder data-transition="fade"}

![Satellite 6.8 micron](assets/images/geos_6_8.jpg){style="height:900px;"}

## $12.0~\mu\mathrm{m}$ (Window) {#satellite-window .ninety .noborder data-transition="fade-in"}

![Satellite 6.8 micron](assets/images/geos_12_0.jpg){style="height:900px;"}

## Water, Window, Visible   {#goes-strip-1 .ninety data-transition="fade-out"}

![Geos strips for IR window](assets/images/geos_strip_01.jpg){width=800px style="border:0; margin:0;vertical-align:bottom;"}
![Geos strips for water-vapor peak visible](assets/images/geos_strip_02.jpg){width=800px style="border:0; margin:0;vertical-align:top;"}

## CO~2~ peak vs. Window {#goes-strip-2 .seventyfive data-transition="fade-in"}

<div style="line-height:0.1;">

![Geos strips for CO2 peak window](assets/images/geos_strip_03.jpg){style="width:750px;border:0; margin:0;vertical-align:bottom;"}
![Geos strips for IR window](assets/images/geos_strip_04.jpg){style="width:750px;border:0; margin:0;vertical-align:top;"}

</div>

# Terrestrial Planets  {#terrestrial-planets .whitetitle .whitetext data-background-color="black" data-transition="fade-out" data-background-transition="fade-out"}

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
</tr>
</table>
</center>



## Earth, Mars, Venus {#earth-mars-venus .ninety data-transition="fade"}

|                             |        Earth              |     Mars                    |       Venus                   |
|:---------------------------:|:-------------------------:|:---------------------------:|:-----------------------------:|
| $\text{Solar constant}$     |  \(1350~\mathrm{W}/\mathrm{m}^2\)  |  \(600~\mathrm{W}/\mathrm{m}^2\)     |  \(2604~\mathrm{W}/\mathrm{m}^2\)      |
| $\text{Albedo}$         | $0.30$          |  $0.17$            |  $0.71$             |
| $T_{\text{radiative}}$  |  $254~\mathrm{K}$   |  $216~\mathrm{K}$      | $240~\mathrm{K}$       |
| $\text{Actual}~T_{\text{surface}}$    |  $295~\mathrm{K}$      |  $240~\mathrm{K}$   |  $700~\mathrm{K}$    |
| One-Layer $T_{\text{surface}}$ | $302~\mathrm{K}$  |  $257~\mathrm{K}$     |  $286~\mathrm{K}$       |

<br/>

### **Vocabulary note:**

::: {}
* "radiative temperature"
* "skin temperature"
* "bare rock temperature"
:::

all mean the same thing.


## Earth, Mars, Venus  {#earth-mars-venus-2 data-transition="fade"}

::: {.centercol .mtop-1 .mbot-1}

|                             |        Earth              |     Mars                    |       Venus                   |
|:---------------------------:|:-------------------------:|:---------------------------:|:-----------------------------:|
| $\text{Solar constant}$     |  \(1350~\mathrm{W}/\mathrm{m}^2\)  |  \(600~\mathrm{W}/\mathrm{m}^2\)     |  \(2604~\mathrm{W}/\mathrm{m}^2\)      |
| $\text{Albedo}$             | $0.30$          |  $0.17$            |  $0.71$             |
| $T_{\text{radiative}}$      |  $254~\mathrm{K}$   |  $216~\mathrm{K}$      | $240~\mathrm{K}$       |
| $\text{Actual}~T_{\text{surface}}$    |  $295~\mathrm{K}$      |  $240~\mathrm{K}$   |  $700~\mathrm{K}$    |
| One-Layer $T_{\text{surface}}$ | $302~\mathrm{K}$  |  $257~\mathrm{K}$     |  $286~\mathrm{K}$       |
| Difference                  | $7~\mathrm{K}$  |  $17~\mathrm{K}$     |  $-414~\mathrm{K}$       |

:::

One-layer model works pretty well for Earth.

Not so well for Mars

Terribly for Venus.

## Earth, Mars, Venus  {#earth-mars-venus-3 data-transition="fade"}

::: {.centercol .mtop-1}

|                             |        Earth              |     Mars                    |       Venus                   |
|:---------------------------:|:-------------------------:|:---------------------------:|:-----------------------------:|
| $\text{Solar constant}$     |  \(1350~\mathrm{W}/\mathrm{m}^2\)  |  \(600~\mathrm{W}/\mathrm{m}^2\)     |  \(2604~\mathrm{W}/\mathrm{m}^2\)      |
| $\text{Albedo}$             | $0.30$          |  $0.17$            |  $0.71$             |
| $T_{\text{radiative}}$      |  $254~\mathrm{K}$   |  $216~\mathrm{K}$      | $240~\mathrm{K}$       |
| $\text{Actual}~T_{\text{surface}}$    |  $295~\mathrm{K}$      |  $240~\mathrm{K}$   |  $700~\mathrm{K}$    |
| One-Layer $T_{\text{surface}}$ | $302~\mathrm{K}$  |  $257~\mathrm{K}$     |  $286~\mathrm{K}$       |
| Difference                  | $7~\mathrm{K}$  |  $17~\mathrm{K}$     |  $-414~\mathrm{K}$       |
| Atmospheric pressure at surface        | $1013~\text{mb}$                   | $6~\text{mb}$                        | $92,\!000~\text{mb}$                     |

:::
