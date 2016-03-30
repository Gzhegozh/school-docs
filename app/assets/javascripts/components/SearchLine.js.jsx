class PeopleSearch extends React.Component {
    //displayName = 'Search';

    constructor(props){
        super(props);
    }

    handleOnKeyup(e) {
        e.preventDefault();
        searchValue = this.search_text.value.trim();
        this.props.onFormSubmit(searchValue);
    }

    render(){
        <form action="+window.location.pathname+" method="get" accept-charset="UTF-8" onkeyup={this.handleOnKeyup.bind(this)}>
            <input ref={(ref) => {this.search_text = ref}} placeholder="Search people..." type="search"/>
        </form>
    }

}
