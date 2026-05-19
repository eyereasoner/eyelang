triple(:AllergicRhinitis, :posterior, 0.0066858405626428041).
triple(:Antibiotic, :expectedAdverse, 0.07).
triple(:Antibiotic, :expectedSuccess, 0.1109525797960936).
triple(:Antibiotic, :utility, 0.89952579796093612).
triple(:Antihistamine, :expectedAdverse, 0.03).
triple(:Antihistamine, :expectedSuccess, 0.10026891936485297).
triple(:Antihistamine, :utility, 0.91268919364852963).
triple(:BacterialPneumonia, :posterior, 0.081537540017297155).
triple(:COVID19, :posterior, 0.48388282341092037).
triple(:Case, :diseases, [:COVID19, :Influenza, :AllergicRhinitis, :BacterialPneumonia]).
triple(:Case, :evidence, [ev(:Fever, true), ev(:DryCough, true), ev(:LossOfSmell, false), ev(:Sneezing, false), ev(:ShortBreath, false)]).
triple(:Case, :evidenceTotal, 0.019182330000000004).
triple(:Case, :posteriors, [0.48388282341092037, 0.42789379600913957, 0.0066858405626428041, 0.081537540017297155]).
triple(:Case, :recommendedTherapy, :Paxlovid).
triple(:Case, :scores, [0.0092820000000000021, 0.008208, 0.00012824999999999997, 0.00156408]).
triple(:Case, :therapies, [:Paxlovid, :Oseltamivir, :SupportiveCare, :Antibiotic, :Antihistamine]).
triple(:Influenza, :posterior, 0.42789379600913957).
triple(:Oseltamivir, :expectedAdverse, 0.08).
triple(:Oseltamivir, :expectedSuccess, 0.28514101258814745).
triple(:Oseltamivir, :utility, 2.6114101258814744).
triple(:Paxlovid, :expectedAdverse, 0.10).
triple(:Paxlovid, :expectedSuccess, 0.388517401170765).
triple(:Paxlovid, :utility, 3.5851740117076503).
triple(:SupportiveCare, :expectedAdverse, 0.01).
triple(:SupportiveCare, :expectedSuccess, 0.29151195397013813).
triple(:SupportiveCare, :utility, 2.8851195397013814).
