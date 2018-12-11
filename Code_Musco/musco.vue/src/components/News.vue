<template>
    <main>
        <h2>Les dernières annonces</h2>
        <section id="news">
            <div class="annonces" v-for="(annonce, a) in annonces" :key="a">
                <!-- <router-link
                :to="{
                    path: `/annonces/${annonce.id}/`,
                    name: 'annonceDetail',
                    params: {id: annonce.id_annonce, annonce: annonce.annonce, annonce_owner: annonce.annonce_owner, date: annonce.date, avatar: annonce.avatar, pseudo: annonce.pseudo, categorie: annonce.categorie, skill: annonce.skil}
                }"> -->
                    <!-- <router-link>    -->
                        <figure>
                            <img :src="getAvatar(annonce.avatar)" :alt="annonce.pseudo">
                        </figure>
                    <!-- </router-link>  -->
                    <!-- <img src="@/assets/Avatars/avatar_par_defaut.jpg" :alt="annonce.pseudo"> -->
                    <article>
                        <h3 id="pseudo">{{ annonce.pseudo }}</h3>
                        <p id="date">{{ annonce.date }}</p>
                        <h4 id="cat">categorie: {{ annonce.categorie }}</h4>
                        <h4 id="skill"> skill: {{ annonce.skill }}</h4>
                        <p id="annonce">{{ annonce.annonce }}</p>
                    </article>
                <!-- </router-link> -->

            </div>
        </section> 
    </main>
</template>

<script>
import axios from "axios";
export default {
    name: "News",
    data () {
        return {
            annonces: []
        };
    },
    methods: {
        getAvatar(url) {
            console.log(url);
            return url ? require(`@/assets/Avatars/${url}`) : require("@/assets/Avatars/avatar_par_defaut.jpg");
            // if (url) {
            //     return require(`@/assets/Avatars/${url}`);
            // } else {
            //     require("@/assets/Avatars/avatar_par_defaut.jpg");
            // }
        },
        getAnnonce() {
            let url = "http://localhost:5000/api/v1/annonces";
            axios.get(url).then(res => {
                this.annonces = res.data;
            }).catch(err => {
                console.log(err);
            });
        }
    },
    created() {
        this.getAnnonce();
        // this.getAvatar(url)
    }
}
</script>

<style scoped lang="scss">
    main {
        width: 100%;
        height: 600px;
        padding-bottom: 60px;

        h2 {
            font-family: 'Shrikhand', cursive;
            letter-spacing: 2px;
            font-size: 30px;
            text-align: center;
            margin-top: 60px
        }

        img {
            height: 50px;
            width: 50px
        }
    }
</style>
