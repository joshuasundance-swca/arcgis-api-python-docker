import pandas as pd
import arcgis


beach_ramps_url = "https://maps1.vcgov.org/arcgis/rest/services/Beaches/MapServer/7"


def test_query_df():
    beach_ramps_layer = arcgis.features.FeatureLayer(beach_ramps_url)
    df = beach_ramps_layer.query(as_df=True)
    assert isinstance(df, pd.DataFrame)  # nosec
    assert len(df) > 0  # nosec
    print("test")
