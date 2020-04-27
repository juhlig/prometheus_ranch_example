{application, 'prometheus_ranch_example', [
	{description, "Test setup for ranch prometheus collector"},
	{vsn, "0.1.0"},
	{modules, ['prometheus_ranch_example_app','prometheus_ranch_example_client','prometheus_ranch_example_protocol','prometheus_ranch_example_sup']},
	{registered, [prometheus_ranch_example_sup]},
	{applications, [kernel,stdlib,ranch,prometheus_ranch,cowboy,prometheus_cowboy]},
	{mod, {prometheus_ranch_example_app, []}},
	{env, []}
]}.