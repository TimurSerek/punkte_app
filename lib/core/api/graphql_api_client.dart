import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:punkte_app/core/resources/constants.dart';

class GraphQLApiClient {
  static HttpLink link = HttpLink(AppConstants.baseUrl);
  static GraphQLClient client = GraphQLClient(
    link: link,
    cache: GraphQLCache(store: InMemoryStore()),
    defaultPolicies: DefaultPolicies(
      query: Policies(fetch: FetchPolicy.networkOnly),
    ),
  );
}
