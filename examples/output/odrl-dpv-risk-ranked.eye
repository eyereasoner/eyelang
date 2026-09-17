# Eyelang result format 1
query(1, at(137, 1), [call(ranked_report(?v0))], [binding("risks", ?v0)]).
result(1, complete, 1).
answer(1, [binding("risks", [ranked(900, "C1", risk_delete_without_safeguards, 100, high_risk, high_severity, "Account removal is permitted without a notice constraint or duty to inform."), ranked(903, "C3", risk_share_without_consent, 97, high_risk, high_severity, "User data sharing is permitted without an explicit consent constraint."), ranked(915, "C2", risk_notice_too_short, 85, high_risk, high_severity, "Terms may change with less notice than the consumer requires."), ranked(930, "C4", risk_no_portability, 70, moderate_risk, moderate_severity, "Portability is restricted because exporting user data is prohibited.")])]).
query(2, at(138, 1), [call(mitigation(?v0, ?v1, ?v2))], [binding("risk", ?v0), binding("measure", ?v1), binding("description", ?v2)]).
result(2, complete, 5).
answer(2, [binding("risk", risk_share_without_consent), binding("measure", mitigate_share_consent), binding("description", "Add an explicit-consent constraint before sharing data.")]).
answer(2, [binding("risk", risk_no_portability), binding("measure", mitigate_portability), binding("description", "Permit data export or remove the export prohibition.")]).
answer(2, [binding("risk", risk_delete_without_safeguards), binding("measure", mitigate_delete_notice), binding("description", "Add a notice-days constraint before account removal.")]).
answer(2, [binding("risk", risk_delete_without_safeguards), binding("measure", mitigate_delete_inform), binding("description", "Add a duty to inform the consumer before account removal.")]).
answer(2, [binding("risk", risk_notice_too_short), binding("measure", mitigate_notice_too_short), binding("description", "Increase noticeDays to meet the consumer requirement.")]).
