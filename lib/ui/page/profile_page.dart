import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pawlog/bloc/bloc.dart';
import 'package:pawlog/model/model.dart';

import 'package:pawlog/ui/component/pl_error.dart';
import 'package:pawlog/ui/component/pl_loading.dart';

import 'package:pawlog/ui/widget/profile/profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (BuildContext context, ProfileState state) {
        if (state is ProfileLoadedState) {
          return _buildPage(
            context,
            state.profile,
          );
        } else if (state is ProfileLoadingState) {
          return PLLoading();
        } else {
          return PLError();
        }
      },
    );
  }

  Widget _buildPage(
    BuildContext context,
    Profile profile,
  ) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ProfileTitle(profile),
          Divider(color: Theme.of(context).colorScheme.secondaryVariant),
          _buildFamilyList(),
          Divider(color: Theme.of(context).colorScheme.secondaryVariant),
          ProfileStoryTimeline([]),
        ],
      ),
    );
  }

  Widget _buildFamilyList() {
    return BlocBuilder<FamilyBloc, FamilyState>(
      builder: (BuildContext context, FamilyState state) {
        if (state is FamilyLoadedState) {
          return ProfileFamilyList(state.family);
        } else if (state is FamilyLoadingState) {
          return PLLoading();
        } else {
          return PLError();
        }
      },
    );
  }
}
