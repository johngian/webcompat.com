# AB testing
## Configuration
You can enable/disable AB testing support by configuring the `config.AB_EXPERIMENT` dictionary.
This will configure flask to set cookies to responses. For example:

```
AB_EXPERIMENTS = {
    'exp': {
        'variation-1': (0, 20),
        'variation-2': (20, 100)
    }
}
```

This will setup an experiment with 2 variations.
Users will have 20% chance to participate in `exp` variation `variation-1` and
80% chance to participate in `exp` variation `variation-2`. You can define multiple experiments.

For example:

```
AB_EXPERIMENTS = {
    'exp-1': {
        'variations': {
            'ui-var-1': (0, 20),
            'ui-var-2': (20, 100)
        },
        'expires': 604800  # 1 week,
    },
    'exp-2': {
        'variations': {
            'variation-1': (0, 40),
            'variation-2': (40, 50),
            'variation-3': (50, 100)
        },
        'expires': 86400  # 1 day
    }
}
```

## How it works
On each request, the AB helper randomly selects a number and if the number falls within the range
of the experiment variation, user participates in this experiment's variation. This is implemented
by adding setting a cookie with name `<experiment_id>` and value `<variation>`. Each experiment
expires after `<expires>` seconds.

## Usage
We can use the following helper method for our AB experiments

* `ab_active`
  * Returns experiment variation if the variation is still active or `False`
