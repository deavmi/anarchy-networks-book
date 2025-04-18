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

![Distance between nodes](communications/drawings/comms_distance_people.drawio.png){ width=300px }

So we must have a situation where at the very least $A$ and $B$ have line of sight with one another, meaning that if they were to stand on top of their rooves they could see one another. This is, at least where I live, something almost all houses have. The problem now simply becomes the distance of the straight line between $A$ and $B$ - we need some technology that can **for now** bridge this gap.

The reason I say "_for now"_ is because once more people get involved they could setup devices in between people $F$ and $E$ who otherwise would not be able to see each other in a line-of-sight fashion _but_ who can both see person $D$:

![Obstructions to wireless node communications](communications/drawings/lack_of_line_of_sight.drawio.png){ width=300px }

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

Mixing the above with the security aspect means that $A$ should be able to send data to $B$ securely and have $D$, $E$ or $F$ (whatever the combinations may be) route it towards the destination, $B$.

![A routed network](communications/drawings/routing.drawio.png){ width=350px }

<!-- underline please -->
This must ensure that $B$ cannot (to a good degree) be spoofed by some <u>other</u> node that is posing to pose as the _real_ node $B$. Likewise it should be entirely permissionless when any of the nodes shown come online; they should be able to peer with neighboring nodes automatically without user intervention on either nodes' part _or_ the wider network as a whole. This last part is important as well, one should be able to announce whatever services their node is making available to the wider network. Such announcements should then be picked up by each node and stored so that they are aware of such a node's service and how to securely route towards it.

The network should also be _reactive_ (or maybe dynamic is a bettwr word) to changing network conditions. If a better route is found then it should be used _or_ if certain nodes go offline then any route which used it should, in a short period of time, be reconfigured to fix itself so that the data can be routed via some _other_ node to its eventual destination. This is not only a requirement for s concern as simple as "My node went offline" but rather to take into account that mobile nodes are part and parcel of such a network we want to build and their physical location often affects routing updates more frquently than that of, say, a laptop at home - something which is in a fixed position.

#### Generic

The system should be generic in that it should not solve only one medium or use-case of communication. WHat is meant by this is that one should be able to send _arbitrary data_ - this can be files, text, images and maybe even some voice notes. We'll clarify later as to why some of these might not be reasonably possible but the idea stands that it should be a generic network. This would mean that I could use it to perhaps send signaling requests to my gate opener and have some application on the other side receive such a request, open my gate and send a reply. At the same time, there should be the ability to build more general chat-like applications on top of the network which would allow for people to make use of it in a way which is rather common these days.

### Summary before we begin

We have discussed the ideas here of what we may want in our solution to building a network. We need something that has the ability to easily have a far reach in terms of network coverage whilst also using a minimal amount of power. The solution used will also have to be able to route data on behalf of others and do so in a secure manner where endpoints are verifiable and the data in transit is encrypted end-to-end. Along with this the network needs to be dynamic in that nodes can come and go from the network _without_ permission and _without_ breaking the network entirely - the network **must** automatically adapt to such changes - without any intervention from its users.

A good question may be:

>"How fast (or slow) need the network be?"

Voila! For this particular scenario we want a network that is high-latency and low-throughput. You will see it won't be entirely true but for the use case we want to accomplish and with our constraints posed - this will be the most likely output.

Here are some use cases:

1. SOS system
2. Device remote control
3. Metrics gathering (think sensor networks)
4. A high-latency e-mail system
    * If one thinks about this use case it should not come entirely as a surprise to users of emails in the early days.
    * There is still a use case for people who need to message each other with _not-so-urgent_ messages that they can have automatically download or download when they decide to hit some "Send/Receive" button.

### Implementation

<!-- <img src="https://reticulum.network/gfx/reticulum_logo_512.png" style="float:right;gap;margin-left:10px;margin-bottom:10px"></img> -->
![Reticulum logo](https://reticulum.network/gfx/reticulum_logo_512.png)


We will be implementing our low-power communications network by making use of a piece of software known as [**Reticulum**](https://reticulum.network/) along with a few other sub-components such as hardware like the [**RNode**](https://deavmi.assigned.network/blog/rnode_adventure_part1/) - all of which be described shortly. It must be known that software is normally only 80% of the solution and the rest of 20% hardware. The reason I say 20% is because the first 10% is choosing hardware based on properties like power consumption, modulation techniques and price **but** the second 10% is an easily over-looked one when one gets started building such projects for the very first time. This is the choice that has to be made of which hardware actually _supports the software_ that we choose to run - it's easy to make a mistake here and buy something that you _think_ might work but ends up not working at all.

In this section we will discuss both our software and hardware selection; with descriptions of what each of their respective components provide to our network in terms of functionality.

#### Our Software choice: _Reticulum_

Reticulum is a cryotpgraphically secure mesh routing network that can route data packets over a set of heterogenous interfaces. That's a whole word salad, for let's break each of those concepts down and see how they match up with the aim of this project.

1. _"cryptographically secure"_
    * This refers to the use of crytography or _the art if hiding "stuff"_.
    * Normally this means that the software supports encryption - which is to say to hide the data in transit from anyone but the intended recipient.
    * It also normally refers to the verification of received data - meaning that it has not been manipulated, from its original form since, during transit to its intended destination. See it as _tamper protection_.
2. _"mesh routing network"_
    * It is a _"routing network"_ in the sense that it can move data or _packets_ from point `A` to be `B` where both may be seperated by intermediary nodes `C`, `D` and `E`.
    * The _"mesh"_ aspect is normally to imply more heavily that entry into the network is rather easy and that the routing paths can adapt to new comers easily and _without permission_. That's normally what people mean when they talk about _"mesh"_ in the context of _"mesh networking"_.
3. _"heterogenous interfaces"_
    * What is an _"interface"_? An interface is a communications port - a method of which your node can discover and communicate with other nodes. This can be a physical port on your device (like an Ethernet connector), a wireless connection or even a software interface (an overlay network like I2P, Yggdrasil or Tor)
    * And _"heteregenous"_? Well, we have actually just answered that. Reticulum doesn't just work over one interface type. It can work over a WiFi link or over a Tor connection online - it has **wide support** for different interface types.

\notebox{Technically speaking the Internet, the one you downloaded this book from, send memes over and receive emails via, \textbf{is} a \textit{"mesh"} network. As stated, however, entry into routing on the Internet at the same level as Internet exchanges is not something I would consider permissionless, not even close.}

#### Interfaces, links and nodes

Let's consider a common scenario for many users of technology. You may very well have a laptop that you are using to read this book and perhaps you have another one in the house somewhere. Knowing that your laptop is a _wire**less**_ device if would have WiFi functionality built-in to it.

WiFi has many different ways of operating however the most common way, especially in home networks, is that of _"AP mode"_ or _access point mode_. This is a mode whereby you have multiple clients called _stations_ that associate with a given access point. To associate with a WiFi access point means that you will receive any data from the network that access point is connected to, this includes computers connected to the access poijt via wired Ethernet but also other wired devices that may be connected to the same (or different _but connected_) access point.

![Access point with two clients](communications/drawings/ap_access.drawio.png){ width=300px }

The devices are _associated_ with the same access point, this means that data packets travel from `A` to `B` _via_ the access point `AP` however the way the devices (`A` and `B` see the network from their point of view) is that of the logical link (as shown in the diagram). `A` believes it is directly connected to `B` and vice-versa.

\break

If we know this then it really simplifies our diagram to this:

![Automatic node discovery over a single link](communications/drawings/disco_oneline.drawio.png){ width=300px }

\notebox{What are the \texttt{wlan0} labels in this diagram? Well, if you recall our talk about interfaces earlier these are, in this case, the WiFi interface names on either node. So here node \texttt{A} has a WiFi interface called \texttt{wlan0} and node \texttt{B} also has a WiFi interface similarly named \texttt{wlan0}.}

This is the first step in realizing that if we simply place two devices, running the Reticulum software, onto the same LAN (local area network) or WLAN (wireless area network) then we can have them automatically discover each other and start communicating.

\break

In Reticulum this would mean that we would need to write up the following configuration for **both** nodes `A` and `B` under the `[interfaces]` section within the Reticulum configuration file at `~/.reticulum/config`.

So on node `A` add this to your `[interfaces]` section:

```{.toml .numberLines}
[interfaces]
    [[WiFi interface]]
        type = AutoInterface
        devices = wlan0
        enabled = yes
```

And then on node `B`:

```{.toml .numberLines}
[interfaces]
    [[WiFi interface]]
        type = AutoInterface
        devices = wlan0
        enabled = yes
```

That is quite literally all it takes for such a basic setup.

---

Now, let's say that node `B` also happens to be on _another_ network, let's say it is plugged into an Ethernet cable that travels over the wall into his neighbors network, of which a third node named `C` is now available.

\importantbox{Please get permission from your neighbor to trunk an Ethernet cable into his yard. You cannot just start digging on somebody else's property. Plus, if you ask then you can get him interested in what you are trying to accomplish anyways. A network is only fun and useful when others are using it.}

![Diagram of a multi-network setup with B acting as a transport node](communications/drawings/disco_multi_net.drawio.png){ width=300px }

In such a case we have **two** LANs, the first would be a WLAN (labeled as _"Network 1"_) and the second would be the LAN (labeled _"Network 2"_). Now normally in such a setup the following would be the result (if we applied a similar configuration to our third node  `C`):

1. Node `A` and `B` would see each other
2. Node `C` and `B` would see each other
3. Node `A` and `C` **would NOT** be able to see each other

How would we ensure that `C` and `A` could see each other? Well, we would have to update the configuration of our node `B` so that it can function as a _transport node_. This means that it will forward announcements from that it _"hears"_ on one interface over to other interfaces (i.e. node `B` would forward the announcement message of `A` over to the network that `C` is on therefore allowing `C` to become aware of `A`). We also need to add a _new_ interface to node `B`'s configuration so as to allow it to discover and talk with node `C`.

We can do both of these changes as follows:

```{.toml .numberLines}
[interfaces]
    [[WiFi interface]]
        type = AutoInterface
        devices = wlan0
        enabled = yes
    [[Wired interface]]
        type = AutoInterface
        devices = eth0
        enabled = yes
[reticulum]
    enable_transport = True
```

Notice how we added an additional entry named `[[Wired interface]]` in the `[interfaces]` section. You can add as many of these as you would like and in fact you shall see that as we progress throughout our journey learning Reticulum we shall do exactly that. Enabling of forwarding was accomplished by the `enable_transport` option within the `[reticulum]` section.

\notebox{By default \textit{transport node} mode is disabled by default therefore node \texttt{A} and \texttt{C} will not forward any packets on behalf of others, only \texttt{B} will.}

Of course, our configuration for our new node `C` would appear as follows:

```{.toml .numberLines}
[interfaces]
    [[Wired interface]]
        type = AutoInterface
        devices = eth0
        enabled = yes
```

#### Applications

1. TODO: Meshchat for laptops and desktops
2. TODO: Sideband for mobile phones
3. TODO: Nomadnet for hackers

