import random


def random_approximates(track, params, **kwargs):

    default_type = "first_four_11_05_2018_13234"
    default_index = "approximates"

    index_name = params.get("index", default_index)
    type_name = params.get("type", default_type)
    selections = random.sample(range(1, 24), 16)

    # print(selections[0:4], selections[4:8], selections[8:12], selections[12:16])
   
    return {
        "body": {
            "query": {
                "bool": {
                    "must": [
                        { "terms": { "sel1": selections[0:4] } },
                        { "terms": { "sel2": selections[4:8] } },
                        { "terms": { "sel3": selections[8:12] } },
                        { "terms": { "sel4": selections[12:16] } }
                    ]
                }
            }
        },
        "index": index_name,
        "type": type_name,
        "cache": params.get("cache", False)
    }

def register(registry):
    registry.register_param_source("approximates-track", random_approximates)