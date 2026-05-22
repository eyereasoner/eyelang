triple(arg_affirming_consequent, conclusion, rain).
triple(arg_affirming_consequent, fallacy, affirming_consequent).
triple(arg_affirming_consequent, reason, "observing the consequent does not prove the antecedent").
triple(arg_affirming_consequent, type, illegitimate_reasoning).
triple(arg_denying_antecedent, conclusion, neg(door_opens)).
triple(arg_denying_antecedent, fallacy, denying_antecedent).
triple(arg_denying_antecedent, reason, "denying the antecedent does not disprove the consequent").
triple(arg_denying_antecedent, type, illegitimate_reasoning).
triple(arg_false_dilemma, conclusion, approve_now).
triple(arg_false_dilemma, fallacy, false_dilemma).
triple(arg_false_dilemma, omittedAlternative, revise_proposal).
triple(arg_false_dilemma, reason, "a relevant alternative is omitted").
triple(arg_false_dilemma, type, illegitimate_reasoning).
triple(arg_hasty_generalization, conclusion, all(crows, black)).
triple(arg_hasty_generalization, fallacy, hasty_generalization).
triple(arg_hasty_generalization, reason, "sample size is below the threshold for a universal conclusion").
triple(arg_hasty_generalization, requiredSampleSize, 30).
triple(arg_hasty_generalization, sampleSize, 3).
triple(arg_hasty_generalization, type, illegitimate_reasoning).
