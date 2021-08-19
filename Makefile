some_rule: rule_1 rule_2 rule_3
	# Will output some_rule"
	echo $@
	# Will output all prerequisites newer than the target
	echo $?
	# Outputs all prerequisites
	echo $^

rule_1:
	touch rule_1
rule_2:
	touch rule_2
rule_3:
	touch rule_3
clean:
	rm -f rule_1 rule_2 rule_3