## Long-range e-mail/remote control/SOS system

Let's think about how we could solve a few problems that fit into or rather are _constrained by_ the following:

### The constraints

#### Costs

This is the first constraint as it relates to the next one. Simply put, this should not cost an _arm and a leg_ (as the saying goes). The parts should be readily available where you are or cheaply shipped and he building procedure should not be costly. The latter normally implies it can be built with tools everyone has or can easily borrow from their neighbor.

The costs of _maintenance_ should be low as well. This refers to the operational costs as well as any fixes - normally of which should relate directly to the previous statement - the parts to be replaced should be inexpensive.

\tipbox{Remember, you may be able to put some money together with members of your community who too are interested in this idea - this can help your crowdsource both personally owned devices (think of buying one for each other every month with pooled funds) \textit{or} one for the whole community to use in a co-operative/trust fashion.}

#### Low power usage

We don't want to consume a lot of electricity, period. We want a device that does not require a high-voltage and has a current draw per-hour that is not very high (meaing every hour the amount of amps pulled must be low).

This constraint allows us to consider various places of installation via various voltage sources:

* Solar energy
    * If we are able to buy a cheap solar panel that supplies the needed voltage then we can make use of what is _in effect_ free energy.
    * The even _more appealing_ aspect of solar is that it means you can place setup operation in a remote location where there is no wiring available - this allows reaching places one would never be able to do otherwise. It is not necessarily the case that one cares all too much for deploying something on a mountain top for some bushman living _there_ but rather because it may be a useful vantage point to connect people on either side of the mountain range.
* Battery operable
    * This constraint _also_ implies that one should be able to build what we shall build in a manner that it is also portable. A solar panel _can_ count here as well but is not practical when sunshine is amiss.
    * Something which can be powered off of a laptop or other sources such as ones phone or an external battery bank is a preferable solution.

#### Realistic _connections_

Such a project involving the fashioning of devices that are to be connected physically (hint: wirelessly) to one another has a problem when one is starting out such a project. Call yourself person $A$ and your potential friend, who wants to join in on this project with you, $B$. There is however, one problem you are far apart from one another albeit in the same town.

![](communications/drawings/comms_distance_people.drawio.pdf)

So we must have a situation where at the very least $A$ and $B$ have line of sight with one another, meaning that if they were to stand on top of their rooves they could see one another. This is, at least where I live, something almost all houses have. The problem now simply becomes the distance of the straight line between $A$ and $B$ - we need some technology that can **for now** bridge this gap.

The reason I say "_for now"_ is because once more people get involved they could setup devices in between people $F$ and $E$ who otherwise would not be able to see each other in a line-of-sight fashion _but_ who can both see person $D$:

![](communications/drawings/lack_of_line_of_sight.drawio.pdf)

However, because we are starting the network from scratch we cannot jump to such an assumption that we will have so many involved on day one, we must be realistic.

Therefore we have reached a new sub-effective constraint from this which is that we need to use some technology that is **long-range**. Both for the fact that is may otherwise be impossible for $A$ to reach $B$ in our aforementioned scenario but also because the side-effect is that the coverage we gain from this may reach other peoples' homes which may be our potential new members. We're really hitting two birds with one stone.

#### Secure

We cannot accept _anything less_ than **end-to-end encryption**. This is simply the standard now and in cases where it is not we must actively push for current solutions to voluntarily add such support or seek entirely new solutions which already have it baked in.

Both the ability to exchange keys (public keys) _IRL_ (in real life) or over an already-encrypted and similarly-verified channel, is a must.

\cautionbox{Remember this adage: \textit{Don't trust, \textbf{verify}}}

The reason to focus so much on this as a priority is that cryptography, when used pervasively throughout a system, can ensure to a good-enough-degree certain properties that are very much aligned with _radical networks_.

<!-- TODO: I would rather have "you" and the "recipient user" underlined than bold-faced -->
We need the channel between _you_ (and your service you are offering to the network; maybe some webpage or forum board) and the _recipient user_ to be secure. Only those 2 parties may read what is sent between one another.

#### Routability

As hinted to earlier the network we want to build does not have as its end-goal the creation of a single communications _"pipe"_ between person $A$ and $B$, rather we envision this growing into something with more than 2 people but also which can adapt to newcomers easily.

When we think about how new users should be onboarded we should consider how we onboarded the original two people, $A$ and $B$, when they were in the process of adding their machines to the network in the very beginning. Each _"node_" (a machine running the software solution) should be soveireign. By this we mean that is can exist in its own right but if it wants to join a network then it need not require permission from others in order to securely communicate _nor_ should it require an onerious setup process.

This boils down to two things:

1. Permissionless
    * If a third node, operated by person $C$, wants to come online and start offering different services then the only thing he needs is to have a public-private key pair (in terms of software; obviously hardware is needed).
    * They should be able to start broadcasting immediately and, if they prefer to, routing traffic on behalf of others
2. Setup process
    * It should not be a difficult process for someone to join the network. What we mean by this isn't that configuration should be banished _completely_ but rather that an operator of a node would only need to setup the communication interfaces he wants **once** and then anyone who wants to use it should be able to.
    * The node latter operator can control this obviously but the idea I am trying to hammer-in here is that for every new node that $A$ could potentially peer with over the _same interface_ should not require an additional configuration option for _every_ new node that could connect to it.

    