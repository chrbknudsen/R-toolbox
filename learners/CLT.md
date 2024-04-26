---
title: CLT
---

# Et bevis for Central Limit Teoremet.

Overordnet: CLT forklarer hvorfor mange fordelinger af data, tenderer en normalfordeling (klokkekurven), når stikprøvestørrelsen bliver stor, uanset den oprindelige fordelings form.

Lad os tage et antal tilfældige variable, $X_1 ... X_n$, der er uafhængige og ens fordelt, med et konstant, kendt gennemsnit $\mu$ og konstant, endelig varians $\sigma^2$.

Så definerer vi en tilfældig variabel Z:

$$ Z = \frac{\overline{X} - \mu}{\sigma/\sqrt{n}}$$

Med disse definitioner:

$$\mu = E(X_i)$$

$$\sigma^2 = Var(X_i) $$

# Den moment genererende funktion

Sådan en fætter er en funktion, der giver os "rå momenter" for en given tilfældig fordeling X, når vi differentierer den med hensyn til t, og sætter t = 0:

$$M_X(t) = \mathbb{E}[e^{tX}]$$

Generelt kan man sige, at hver fordeling har sig egen unikke moment genererede funktion (MGF).

$$M_X(0) = 1$$

Fordi 0X er lig 0 og $e^0 = 1$

Differentierer vi en gang mht t får vi:

$$M_X'(t) = \frac{d}{dt} M_X(t) = \frac{d}{dt} \mathbb{E}[e^{tX}] = \mathbb{E}[Xe^{tX}]$$

Sætter vi t = 0, får vi forventningsværdien, eller gennemsnittet, af fordelingen.

$$M_X'(t) = \mathbb{E}[X]$$

Differentierer vi en gang til får vi: $$M_X''(t) = \frac{d^2}{dt^2} M_X(t) = \frac{d^2}{dt^2} \mathbb{E}[e^{tX}] = \mathbb{E}[X^2 e^{tX}]
$$

Og sætter vi t = 0, får vi det andet rå moment af fordelingen:

$$M_X''(0) = \mathbb{E}[X^2]$$

for at få variansen trækker vi kvadratet på gennemsnittet fra:

$$\sigma^2 = \mathbb{E}[X^2] - (\mathbb{E}[X])^2 = M_X''(0) - [M_X'(0)]^2$$
