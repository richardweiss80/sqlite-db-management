INSERT INTO YAYAREPORULESET (name, url, description, enabled) 
VALUES 
    ('McAfee Advanced Threat Research IOCs', 'https://github.com/advanced-threat-research/IOCs.git', 'IOCs, including YARA rules, to accompany McAfee ATRs blog and other public posts.', 'true'),
    ('Citizen Lab Malware Signatures', 'https://github.com/citizenlab/malware-signatures.git', 'YARA signatures developed by Citizen Lab. Dozens of signatures covering a variety of malware families. The also inclde a syntax file for Vim. Last update was in November of 2016.', 'true'),
    ('CAPE Rules', 'https://github.com/ctxis/CAPE.git', 'Rules from various authors bundled with the Config And Payload Extraction Cuckoo Sandbox extension (see next section).', 'true'),
    ('CDI Rules', 'https://github.com/CyberDefenses/CDI_yara.git', 'Collection of YARA rules released by [CyberDefenses](https://cyberdefenses.com/blog/) for public use. Built from information in intelligence profiles dossiers and file work.', 'true'),
    ('Deadbits Rules', 'https://github.com/deadbits/yara-rules.git', 'A collection of YARA rules made public by [Adam Swanda](https://www.deadbits.org, Splunks Principal Threat Intel. Analyst, from his own recent malware research.', 'true'),
    ('yara4pentesters', 'https://github.com/DiabloHorn/yara4pentesters.git', 'Rules to identify files containing juicy information like usernames, passwords etc.', 'true'),
    ('Didier Stevens Rules', 'https://github.com/DidierStevens/DidierStevensSuite.git', 'Collection of rules from Didier Stevens, author of a suite of tools for inspecting OLE/RTF/PDF. Didiers rules are worth scrutinizing and are generally written purposed towards hunting. New rules are frequently announced through the [NVISO Labs Blog](https://blog.nviso.be/).', 'true'),
    ('FSF Rules', 'https://github.com/EmersonElectricCo/fsf.git', 'Mostly filetype detection rules, from the EmersonElectricCo FSF project (see next section).', 'true'),
    ('ESET IOCs', 'https://github.com/eset/malware-ioc.git', 'Collection of YARA and Snort rules from IOCs collected by ESET researchers. Theres about a dozen YARA Rules to glean from in this repo, search for file extension .yar. This repository is seemingly updated on a roughly monthly interval. New IOCs are often mentioned on the [ESET WeLiveSecurity Blog](https://www.welivesecurity.com/).', 'true'),
    ('Franke Boldewin Rules', 'https://github.com/fboldewin/YARA-rules.git', 'A collection of YARA Rules from [@r3c0nst](https://twitter.com/@r3c0nst).', 'true'),
    ('Fidelis Rules', 'https://github.com/fideliscyber/indicators.git', 'You can find a half dozen YARA rules in Fidelis Cybers IOC repository. They update this repository on a roughly quarterly interval. Complete blog content is also available in this repository.', 'true'),
    ('Yara-Unprotect', 'https://github.com/fr0gger/Yara-Unprotect.git', 'Rules created for the Unprotect Project for detecting malware evasion techniques.', 'true'),
    ('GoDaddy ProcFilter Rules', 'https://github.com/godaddy/yara-rules.git', 'A couple dozen rules written and released by GoDaddy for use with ProcFilter (see next section). Example rules include detection for packers, mimikatz, and specific malware.', 'true'),
    ('h3x2b Rules', 'https://github.com/h3x2b/yara-rules.git', 'Collection of signatures from h3x2b which stand out in that they are generic and can be used to assist in reverse engineering. There are YARA rules for identifying crypto routines, highly entropic sections (certificate discovery for example), discovering injection / hooking functionality, and more.', 'true'),
    ('lw-yara', 'https://github.com/Hestat/lw-yara.git', 'Ruleset for scanning Linux servers for shells, spamming, phishing and other webserver baddies.', 'true'),
    ('InQuest Rules', 'https://github.com/InQuest/yara-rules.git', 'YARA rules published by InQuest researchers mostly geared towards threat hunting on Virus Total. Rules are updated as new samples are collected and novel pivots are discovered. The [InQuest Blog](http://blog.inquest.net) will often discuss new findings.', 'true'),
    ('Intezer Rules', 'https://github.com/intezer/yara-rules.git', 'YARA rules published by Intezer Labs.', 'true'),
    ('Sophos AI YaraML Rules', 'https://github.com/inv-ds-research/yaraml_rules.git', 'A repository of Yara rules created automatically as translations of machine learning models. Each directory will have a rule and accompanying metadata: hashes of files used in training, and an accuracy diagram (a ROC curve).', 'true'),
    ('jeFF0Falltrades Rules', 'https://github.com/jeFF0Falltrades/YARA-Signatures.git', 'A collection of YARA signatures for various malware families.', 'true'),
    ('BinSequencer', 'https://github.com/karttoon/binsequencer.git', 'Find a common pattern of bytes within a set of samples and generate a YARA rule from the identified pattern.', 'true'),
    ('PasteHunter', 'https://github.com/kevthehermit/PasteHunter.git', 'Custom yara rules', 'true'),
    ('kevthehermit Rules', 'https://github.com/kevthehermit/YaraRules.git', 'Dozens of rules from the personal collection of Kevin Breen. This repository hasnt been updated since February of 2016.', 'true'),
    ('Malice.IO YARA Plugin Rules', 'https://github.com/malice-plugins/yara.git', 'Collection of topical from a variety of sources for the YARA component of the Malice.IO framework.', 'true'),
    ('NCC Group Rules', 'https://github.com/nccgroup/Cyber-Defence.git', 'A handful of YARA rules released by NCC Groups Cyber Defence team.', 'true'),
    ('Florian Roth Rules', 'https://github.com/Neo23x0/signature-base.git', 'Florian Roths signature base is a frequently updated collection of IOCs and YARA rules that cover a wide range of threats. There are dozens of rules which are actively maintained. Watch the repository to see rules evolve over time to address false potives / negatives.', 'true'),
    ('Patrick Olsen Rules', 'https://github.com/prolsen/YaraRules.git', 'Small collection of rules with a wide footprint for variety in detection. RATs, documents, PCAPs, executables, in-memory, point-of-sale malware, and more. Unfortunately this repository hasnt seen an update since late 2014.', 'true'),
    ('rastrea2r', 'https://github.com/rastrea2r/rastrea2r.git', 'Triage suspect systems and hunt for Indicators of Compromise (IOCs) across thousands of endpoints in minutes.', 'true'),
    ('reversinglabs-yara-rules', 'https://github.com/reversinglabs/reversinglabs-yara-rules.git', 'Custom yara rules', 'true'),
    ('SpiderLabs Rules', 'https://github.com/SpiderLabs/malware-analysis.git', 'Repository of tools and scripts related to malware analysis from the researchers at SpiderLabs. Theres only three YARA rules here and the last update was back in 2015, but worth exploring.', 'true'),
    ('ConventionEngine Rules', 'https://github.com/stvemillertime/ConventionEngine.git', 'A collection of Yara rules looking for PEs with PDB paths that have unique, unusual,  or overtly malicious-looking keywords, terms, or other features.', 'true'),
    ('Icewater', 'https://github.com/SupportIntelligence/Icewater.git', 'Rules created by Icewater', 'true'),
    ('Tenable Rules', 'https://github.com/tenable/yara-rules.git', 'Small collection from Tenable Network Security.', 'true'),
    ('TjadaNel Rules', 'https://github.com/tjadanel/yara_repo.git', 'Small collection of malware rules.', 'true'),
    ('QuickSand Lite Rules', 'https://github.com/tylabs/quicksand_lite.git', 'This repo contains a C framework and standalone tool for malware analysis, along with several useful YARA rules developed for use with the project.', 'true'),
    ('VectraThreatLab Rules', 'https://github.com/VectraThreatLab/reyara.git', 'YARA rules for identifying anti-RE malware techniques.', 'true'),
    ('x64dbg Signatures', 'https://github.com/x64dbg/yarasigs.git', 'Collection of interesting packer, compiler, and crypto identification signatures.', 'true'),
    ('yara-forensics', 'https://github.com/Xumeiquer/yara-forensics.git', 'Set of Yara rules for finding files using magics headers', 'true');